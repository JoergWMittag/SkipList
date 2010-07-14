require "test/unit"
require "lib/skiplist.rb"

class TestSkipList < Test::Unit::TestCase
    def setup
        @unsorted = [84, 52, 53, 35, 46, 18, 95, 88, 26, 4]
        @sorted   = [4, 18, 26, 35, 46, 52, 53, 84, 88, 95]
        @skiplist = SkipList.new(16)
    end

    def test_insert_array
         @skiplist.insert(@unsorted)
         assert_equal(@sorted, @skiplist.to_a, "Should be equal")
    end

    def test_insert_value
        @skiplist.insert(@unsorted)
        @skiplist.insert(10)
        assert_equal((@unsorted << 10).sort, @skiplist.to_a, "Should be equal")
    end

    def test_search
        @skiplist.insert(@unsorted)
        assert_equal(52, @skiplist.search(52), "Should return 52 as 52 is a skiplist member")
        assert_equal(nil, @skiplist.search(54), "Should return nil as 54 is not a skiplist member")
    end

end
