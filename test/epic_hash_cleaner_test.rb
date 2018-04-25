require 'test_helper'

describe EpicHashCleaner do
  it 'has a version number' do
    refute_nil ::EpicHashCleaner::VERSION
  end

  describe '#clean' do
    it 'removes unwanted elements' do
      input = { a: nil, b: '', c: [], d: {} }
      assert_equal({}, ::EpicHashCleaner.clean(input))

      input = { a: false, b: ' ' }
      assert_equal({ a: false, b: ' ' }, ::EpicHashCleaner.clean(input))

      input = { a: [nil], b: [nil, '', [{}], { a: [''] }] }
      assert_equal({}, ::EpicHashCleaner.clean(input))

      input = { a: { b: { c: [{ d: ['', 1], e: nil }] } } }
      assert_equal({ a: { b: { c: [{ d: [1] }] } } }, ::EpicHashCleaner.clean(input))
    end

    it 'returns an empty hash for nil' do
      assert_equal({}, ::EpicHashCleaner.clean(nil))
    end
  end
end
