require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
    def setup
      @recipe = Recipe.new(name:"anjero malawax",summary: "this is the best pancake by somalis",
                description: "mix wheat flour with water, koroga vizuri,
                put a flat frying pan on the jiko,smear some oil,
                pour some of the mixture on the frying pan,flating it,
                after 2minute the anjero is ready ")
    end
      test "Recipe should be valid" do
      assert @recipe.valid?
    end
    test "name should be present" do
      @recipe.name =""
      assert_not @recipe.valid?
    end
    test "name length should not be too long" do
      @recipe.name ="a"*101
      assert_not @recipe.valid?
    end
    test "name length should not be too short" do
      @recipe.name="aaaa"
      assert_not @recipe.valid?
    end
    test "summary should be present" do
      @recipe.summary = " "
      assert_not @recipe.valid?
    end
    test "summary length should not be too long" do
      @recipe.summary = "a"*151
      assert_not @recipe.valid?
    end
    test "summary length sholud not be too short" do
      @recipe.summary ="a"*9
      assert_not @recipe.valid?
    end
    test "description should be present" do
      @recipe.description = " "
      assert_not @recipe.valid?
    end
    test "description should not be too long" do
      @recipe.description ="a"*501
      assert_not @recipe.valid?
    end
    test "description length should not be too short" do
      @recipe.description ="a"*19
      assert_not @recipe.valid?
    end
end
