require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!

 # def setup
 #   @rocket = Rocket.new
 # end

 def test_initialize_rocket_with_name
   @rocket = Rocket.new( { :name => "Bob" } )
   assert_equal(@rocket.name, "Bob")
 end

 def test_initialize_rocket_without_name
   @rocket = Rocket.new
   assert_equal(@rocket.name.class, String)
 end

 def test_initialize_rocket_name_present
   #arrange
   rocket = Rocket.new

   #act
   name = Rocket.name

   #assert
   assert name != nil
 end

 def test_initialize_rocket_name_without_string_values
   @rocket = Rocket.new( { :name => 123 } )
   assert @rocket.name.class != String
   #input = some numbers as name 12345
   #output = @rocket.name.class, !=String
 end

 def test_updating_name
   @rocket = Rocket.new(  { :name => "Bob" }  )
   @rocket.name= "Cat"
   assert_equal(@rocket.name, "Cat")
 end

 def test_updating_name_should_fail
   @rocket = Rocket.new(  { :name => "Bob" }  )
   @rocket.name= "Cat"
   refute_equal(@rocket.name, "Bob")
 end

  def test_initialize_rocket_with_colour
    @rocket = Rocket.new( { :colour => "Red" } )
    assert_equal(@rocket.colour, "Red")
  end

  def test_initialize_rocket_without_colour
    @rocket = Rocket.new
    assert_equal(@rocket.colour.class, String)
  end

  def test_initialize_rocket_colour_not_nil
    @rocket = Rocket.new( { :colour => nil})

    #act

    #assert
    assert @rocket.colour != nil
  end

  def test_rocket_is_truley_flying?
    @rocket = Rocket.new( { :flying => 'Bob' } )
    assert @rocket.flying?
  end

  def test_rocket_is_not_flying?
    @rocket = Rocket.new
    refute @rocket.flying?
    #assert @rocket.flying? == false
  end

  def test_lift_off_rocket_not_flying
    #1) if rocket is in flight then lift off is false as it is already in the air.

    @rocket = Rocket.new
    assert(@rocket.lift_off)
  end

  def test_lift_off_rocket_flying
    #2) if rocket is not in flight then Lift Off is possible - so it should return true
    @rocket = Rocket.new

    # make rocket flying
    @rocket.lift_off

    refute(@rocket.lift_off)

  end


  def test_land_rocket_when_not_flying
    #1)if rocket is flying(true), then reset @flying to false and land returns true
    @rocket = Rocket.new
    refute(@rocket.land)
  end

   def test_land_rocket_flying
     @rocket = Rocket.new( { :flying => "yes" } )
     assert(@rocket.land)
   end

   def test_status_message_of_rocket_when_flying
     @rocket = Rocket.new( { :flying => "yes", :name => "bob" } )
     assert_equal(@rocket.status,"Rocket bob is flying through the sky!")
   end

   def test_status_message_of_rocket_when_not_flying
     @rocket = Rocket.new( { :name => "bob" } )
     assert_equal(@rocket.status, "Rocket bob is ready for lift off!" )
   end

  #   @rocket.
  #   assert(@rocket.land)
  # end

 # def test_name=(new_name)
 # end
 #
 # def test_colour
 # end

#example
 ##def change_name(new_name)
 #@name = new_name
 #end



end
