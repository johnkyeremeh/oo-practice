describe Author do 
    it 'has a name' do 

        #setup
        author = Author.new
        author.name = "Hemingway"

        #expectation
        
        expect(author.name).to eq("Hemingway")
    end


    context 'has many stories' do 
        describe '#stories' do 
            it 'has an empty array of stories when initialized' do 
                author = Author.new

                expect(author.stories).to match_array([])
            end

            it 'returns a frozen copy of a stories array' do 
                author = Author.new
                expect(author.stories).to be_frozen
            end

        end

        describe '#add story' do 
            it 'can add a story instances into it' do 
                author = Author.new
                story = Story.new

                author.add_story(story)

                expect(author.stories).to include(story) 
            end

            it 'only allows stories to be pushed onto it' do 
                author = Author.new
                story = "Old Man and the Sea"


                expect{author.add_story(story)}.to raise_error(AssociationTypeMismatchError)
            end
        end

        describe "#bibliography" do
            it 'returns an array of all stories names of the author' do 
                author = Author.new

                story_1 = Story.new.tap{|s| s.name = "Old Man and the Sea"}
                story_2 = Story.new.tap{|s| s.name = "The Sun Also Rises"}
                story_3 = Story.new.tap{|s| s.name = "For Whom the Bell Tolls"}

                author.add_story(story_1)
                author.add_story(story_2)
                author.add_story(story_3)
                
                expect(author.bibliography).to match_array(["Old Man and the Sea","The Sun Also Rises","For Whom the Bell Tolls"])
            end
        end
    end
end





