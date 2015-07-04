# middleman-ya_lorem_ja #

Middleman 用の日本語 lorem 拡張を作成したい。

## インストール方法 ##

Gemfile に以下を追加し、"bundle install"してください。

```
gem "middleman-ya_lorem_ja" , :git => 'git://github.com/tanalab2/middleman-ya_lorem_ja'
```

あとは、 middleman の config.rb に以下を追加し、 ya_lorem_ja を有効化してください。

``` ruby
activate :ya_lorem_ja
```

ya_lorem_ja が有効になり、 erb ファイルなどで、
lorem_ja オブジェクトが使用できるようになります。

erb に以下を記載した場合は、

``` ruby
<h1><%= lorem_ja.word %></h1>
<h2><%= lorem_ja.words(5) %></h2>
<p><%= lorem_ja.sentence %></p>
<p><%= lorem_ja.sentences(3) %></p>
<p>
<%= lorem_ja.paragraph %>
<%= lorem_ja.paragraphs(3) %>
</p>
```

以下のように出力されます。

``` html
<h1>風博士の遺書</h1>
<h2>賢明にして正大なること太平洋の如き諸君よ</h2>
<p>諸君はすでに、正当なる攻撃は一つとして彼の詭計に敵し難い所以を了解せられたに違いない。</p>
<p>噫呼、それは大変残念である。</p>
<p>
それ故僕は唯一の目撃者として、偉大なる風博士の臨終をつぶさに述べたいと思うのである。
そして諸君は偉大なる風博士を御存知であろうか？

諸君よ、翌日の夜明けを期して、かの憎むべき蛸はついに蛸自体の正体を遺憾なく暴露するに至るであろう！

この珍奇なる部落は、人種、風俗、言語に於て西欧の全人種に隔絶し、実に地球の半廻転を試みてのち、極東じゃぽん国にいたって初めて著しき類似を見出すのである。
</p>
```

## Middleman の lorem のインターフェース ##

Middleman では 標準 extensions で ヘルパーメソッド に lorem メソッドが用意されています。

lorem の主なインターフェイスは以下です。

- word
- words(num_of_words)
- sentences(num_of_sentces)
- paragraph
- paragraphs(num_of_paragraph)
- date(fmt='%a %b %d, %Y')
- name
- first_name
- last_name
- tweet
- email
- image(size, options={})
- randm(range)


また、 lorem は語彙？を定数としてもっており、
上記インターフェースからこれらの定数からランダムに言葉を選択し返却しています。

使われている定数は以下です。

- WORDS # 249語 の英単語を保持
 - words(num_of_words) は WORDS から num_of_words 個数分 ランダムに語を抽出
 - sentences(num_of_sentces) は WORDS から 4〜15個の語を選択し先頭語を capitalize し、最後の語の末尾に"."を付与
 - paragraphs(num_of_paragraph) は 3〜7個の sentences を抽出し、先頭語をcapitalize し、各文を"\n\n"で結合


## 日本語版の実装方針 ##

まずは、日本語版も同様の実装にしてみます。

実装するインターフェースは以下とします。

- word
- words(num_of_words)
- sentences(num_of_words)
- paragraph
- paragraphs(num_of_sentces)

また、以下のインターフェースは lorem の実装をそのまま使用する。

- date(fmt='%a %b %d, %Y')
- image(size, options={})


また、青空文庫から文書を頂戴し、文の配列を定数に管理する。
word は面倒なんので、
1語 2〜6文字とし、 (num_of_words × 2〜6文字) に収まる文字数の文を返却することにします。
(返却するときには、末尾の句読点を除去します。)

## 参考 ##

* [lorem_jp](https://github.com/dayflower/lorem_jp/ ) 

  すでに日本語版 lorem を作成されている方がいます。これを参考にしつつ、 Middleman の lorem ライクの実装をしたいと思います。
  

* [lorem.rb](https://github.com/middleman/middleman/middleman-core/lib/middleman-more/extensions/lorem.rb )

* [坂口安吾「風博士」](http://www.aozora.gr.jp/cards/001095/card42616.html)

  文の配列は、青空文庫から拝借しました。

* [middleman-ya_lorem_ja を使用したサンプルページ](http://discountinnovations.com/articles/middleman/lorem_ja.html) 


## License
* MIT
    


