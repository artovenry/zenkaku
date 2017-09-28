assert= require "power-assert"

HANKAKU_EISUU= "\u0021-\u007e"
HANKAKU_KANA= "([\uff66-\uff9c]\uff9e)|([\uff8a-\uff8e]\uff9f)|([\uff61-\uff9f])"

COMPLEMENT_OF_HANKAKU_KANA= ""

HANKAKU_SPACE= "(\s|\u00A0)"


describe "ZenkakuValidator", ->
  it "should ban invalid input", ->
    do (reg= ///^[#{HANKAKU_EISUU}]+$///g)->
      assert     reg.test "konnichiha"
      assert not reg.test "ｺﾝﾆﾁﾊkonnichiha"
      assert not reg.test "Ｋkonnichiha"
      assert     reg.test "hoge@gmail.com"
      assert not reg.test "I wonder why autoumn comes..."
      assert     reg.test "iWonderWhyAutomnComes..."

    assert ///^[^#{HANKAKU_EISUU}]+$///g.test "ｺﾝﾆﾁﾊ"

    assert ///^#{HANKAKU_KANA}+$///g.test "ｲﾛﾊﾆﾎﾍﾄﾁﾘﾇﾙｦ"


