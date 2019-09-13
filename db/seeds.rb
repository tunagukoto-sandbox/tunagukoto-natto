# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
School.create(school_name: "名古屋大学")
School.create(school_name: "名古屋市立大学")
School.create(school_name: "名城大学")
School.create(school_name: "立命館大学")
School.create(school_name: "武蔵野美術大学")

Student.create(name: "gonza",email: "6@gmail.com", password: "666666", school_id: 1)

# 主タグ生成
Tag.create(
            uuid: 1,
            tag_name: "シャショク", 
            tag_info: "大学や就職活動な場で聞く企業説明会がつまらない…
働くことについてのイメージがわかない…
経営者から会社や業界について教えて欲しい
企業のホンネが聞きたい!!", 
            tag_body: "そんな学生の声から生まれたのが「シャショク」です。
「シャショク」は、愛知県にある優良企業の経営者をたちに
各業界の仕組みをインタビュー形式で語ってもっらうイベントです。
社長自身の経験から商流・物流を通して社会について学び、リアルなキャリア研究を行うことができます。
登壇後の懇親会では、食事を交えて経営者をはじめとする社会人の方々との交流を深める時間を用意しています。")

Tag.create( 
            uuid: 2,
            tag_name: "ガクショク",
            tag_info: "学生よ夢を、語れ。",
            tag_body: "学生が今、取り組んでいる内容、自分の夢や将来のビジョンを語り、
学生の現在(いま)を経営者、社会人、学生へ発信し共有する場です。
プレゼンターは自分の「アイディア」や「思い」を具体的に形にして、
ビジネスでも通用するプレゼン技術を養いながら自身の可能性を追求することで
自分の現在地を知り今後どのように夢の実現に向けて活動していくのかを考えるイベントになっています。")
Tag.create(
            uuid: 3,
            tag_name: "キャリアコネクション",
            tag_info: "体験」「理解」「対話」3つの要素が複合されたイベントです",
            tag_body: "学生と社会人の枠を超えてケーススタディ取り組み課題達成へのプロセスを作り上げます。
学生、社会人、経営者の異なる視点で考えや価値観をぶつけ合いビジネスで通用するスキルを磨きます
またイベント後のカジュアルな懇親会ではビジネスパートナーとして長く付き合える繋がりを構築します。")

# サブタグ生成-今後も増えていく予定
SubTag.create(sub_tag_name: "工場見学")
SubTag.create(sub_tag_name: "マーケティング")
SubTag.create(sub_tag_name: "営業")
SubTag.create(sub_tag_name: "技術職")


10.times do |i|
    Event.create(
        event_name: "ツナグコトの歴史#{i}",
        event_title: "橋の安全を影から支える、橋の排水装置・検査路を作る橋梁付属品のスペシャリスト",
        event_question: "橋梁技建ってどんな会社？",
        event_description: "外灯がなく（少なく）暗いこと
    	広く開けていること・広い駐車場があること
    	夜間使用可能なトイレがあること
    	周辺に民家がないこと
    	街に近過ぎずたりたまり場になっていないこと
    	天体観測愛好家や無線愛好家などがいるところ",
        event_location: "山形市内の気温が22度だったとして、蔵王の山の上では気温が13度と大変涼しい",
        event_cost: "無料",
        event_time: Date.today,
        event_time_detail: "17:45~20:45",
        event_company_name: "一般社団法人ツナグコト",
        event_president: "ジーザス　クライス",
        event_president_birth_day: "000年 12月 25日",
        event_motto: "左ほほを蓋れたら右ほほも差し出しなさい",
        event_population: 20,
     	google_form: "",
    )
end
10.times do |i|
    Company.create(company_name: "#{i}ツナグ",
        company_url: "https://ibuki-study.net",
        company_locate: "愛知県",
        company_start_year: 2,
        number_of_employee: 10000,
        what_company_do: "インターネットで世界を楽しくデータで感を数値化技術は盗むのではなく継承されるものに。データ・ドリブンの世界へようこそ",
        attractive_point: "最先端の研究をビジネスの現場にいかす。あなたのオリジナリティーが活かせる職場です。",
        email: "#{i}foobar@baz.com",
        password: "password#{1}",
    )
end
Event.all.each do |e|
    EventTag.create(tag_id: 1, event_id: e.id)
end

SubTag.all.each do |st|
    EventSubTag.create(sub_tag_id: st.id, event_id: 1)
end

5.times do |i|
    Quest.create(
        company_name: "一般社団法人ツナグコト",
        title: "ツナグコトの歴史",
        uuid: "Sjj34444",
        description: "あああああssあああああssあああああssあああああssあああああssあああ
        ああssあああああssあああああssあああああssあああああssあああああssあああああssあああ
        ああssあああああssあああああssあああああssあ",
        gift: "実労働時間✖️1000",
        gift_detail: "交通費あり",
        dead_line: "2019年7月12日 ~  2019年7月18日",
        dead_line_detail: "上記の日程の中で最低5日"
    )
end

10.times do |i|
    Question.create(title: "あああああssあああああssあああああssあああああssあああああssあああ
    ああssあああああssあああああssあああああssあああああssあああああssあああああssあああ
    ああssあああああssあああああssあああああssああああ#{i}", q_body: "aaaaaaaaaaaaaaa", student_id: 1)
end

Admin.create(email: "tunagukoto@gmail.com", password: "tunagu2019")




