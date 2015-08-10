# middleman-ya_lorem_ja #

Middleman 用の日本語 lorem 拡張です。

## Installation

Add this line to your application's Gemfile:

    gem 'middleman-ya_lorem_ja'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-ya_lorem_ja


あとは、 middleman の config.rb に以下を追加し、 ya_lorem_ja を有効化してください。

``` ruby
activate :ya_lorem_ja
```

また、以下により、文章リソースを変更できます。(:resource_nameを指定しない場合は、坂口安吾「風博士」が使用されます。)

```ruby
# 宮沢賢治「注文の多い料理店」を使用する場合
activate :ya_lorem_ja, :resource_name => :chuumon_no_ooi_ryouriten
```

ya_lorem_ja が有効になり、 erb ファイルなどで、
lorem_ja オブジェクトが使用できるようになります。

erb に以下を記載した場合は、

``` ruby
<h1><%= lorem_ja.date%></h1>
<img src="<%= lorem_ja.image('200x200')%>"/>
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
<h1>2001年03月19日</h1>
<img src="http://placehold.it/200x200"/>
<h1>風博士の遺書</h1>
<h2>諸氏よ、誰人かよく蛸を懲す勇士なきや</h2>
<p>余の妻は麗わしきこと高山植物の如く、実に単なる植物ではなかったのである！</p>
<p>かりに諸君、聡明なること世界地図の如き諸君よ、諸君は学識深遠なる蛸の存在を認容することが出来るであろうか？
高尚なること檞の木の如き諸君よ、諸君は何故彼如き陋劣漢を地上より埋没せしめんと願わざる乎。
しかるに諸君、ああ諸君、おお諸君、余は敗北したのである。
</p>
<p>
そのために、余は空気の如く彼の寝室に侵入することが出来たのである。
この珍奇なる部落は、人種、風俗、言語に於て西欧の全人種に隔絶し、実に地球の半廻転を試みてのち、極東じゃぽん国にいたって初めて著しき類似を見出すのである。
ああ三度冷静なること扇風機の如き諸君よ、かの憎むべき蛸博士は何等の愛なくして余の妻を奪ったのである。
偉大なる博士はシルクハットを被り直したのである。
僕は階段の途中に凝縮して、まだ響き残っているその慌しい跫音を耳にしながら、ただ一陣の突風が階段の下に舞い狂うのを見たのみであった。
</p>
<p>
諸君よ、翌日の夜明けを期して、かの憎むべき蛸はついに蛸自体の正体を遺憾なく暴露するに至るであろう！
諸氏よ、誰人かよく蛸を懲す勇士なきや。
余の力を以てして、彼の悪略に及ばざることすでに明白なり矣。
全てこれらの狼狽は極めて直線的な突風を描いて交錯する為に、部屋の中には何本もの飛ぶ矢に似た真空が閃光を散らして騒いでいる習慣であった。
そして、今、東北端の肱掛椅子から移転したばかりに相違ない証拠には、一陣の突風が東北から西南にかけて目に沁み渡る多くの矢を描きながら走っていたのである。

偉大なる博士が彼の女に目をつけたのは流石に偉大なる見識といわねばならない。
たとえば、時計はいそがしく十三時を打ち、礼節正しい来客がもじもじして腰を下そうとしない時に椅子は劇しい癇癪を鳴らし、物体の描く陰影は突如太陽に向って走り出すのである。
たとえば諸君、頃日余の戸口に Banana の皮を撒布し余の殺害を企てたのも彼の方寸に相違ない。

実に諸君、彼は秘かに別の鬘を貯蔵していたのである。
成吉思汗は欧州を侵略し、西班牙に至ってその消息を失うたのである。
そして其筋の計算に由れば、偉大なる風博士は僕と共謀のうえ遺書を捏造して自殺を装い、かくてかの憎むべき蛸博士の名誉毀損をたくらんだに相違あるまいと睨んだのである。
諸君はその時、実にあわただしい後悔と一緒に黄昏に似た沈黙がこの書斎に閉じ籠もるのを認められるに相違ない。
</p>
```

## Interface ##

実装するインターフェースは以下です。

- word
- words(num_of_words)
- sentence
- sentences(num_of_words)
- paragraph
- paragraphs(num_of_sentces)
- date(fmt='%Y年%m月%d日')
- image(size, options={})


## 参考 ##

* [tanalab2/ya_lorem_ja](https://github.com/tanalab2/ya_lorem_ja) 
* [middleman-ya_lorem_jaの使い方](http://discountinnovations.com/articles/middleman/03.html)
* [日本語 Lorem サンプル(風博士 版)](http://discountinnovations.com/articles/middleman/lorem_ja.html)
* [日本語 Lorem サンプル(注文の多い料理店 版)](http://discountinnovations.com/articles/middleman/lorem_ja_chuumon_no_ooi_ryouriten.html) 

## License
* MIT
    


