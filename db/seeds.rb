Admin.create(email: "tunagukoto@gmail.com", password: "tunagu2019")
Admin.create(email: "natto-test@gmail.com", password: "password")

[
    "社会人", "名城大学", "武蔵野美術大学", "愛知大学", "愛知学院大学",  
    "愛知淑徳大学", "愛知県立大学","愛知教育大学", "愛知県立芸術大学", "愛知工業大学", 
    "愛知産業大学", "愛知医科大学","桜花学園大学", "関西大学", "関西学院大学", "金城学院大学", 
    "椙山女学園大学","星城大学", "中京大学", "中部大学", "東海学園大学","同志社大学","豊橋技術科学大学", 
    "名古屋産業大学", "名古屋大学", "名古屋市立大学", "名古屋工業大学","名古屋外国語大学","名古屋学院大学","名古屋学芸大学", "南山大学",           
    "日本福祉大学",    
    "立命館大学"
].each do |uni| School.create!(school_name: uni) end

[
    "工場見学","プログラミング","キャリアアップ","営業","技術職","マーケティング","いろんな経験を詰める"
].each do |sub_tag| SubTag.create!(sub_tag_name: sub_tag) end

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

Tag.create(
            uuid: 4,
            tag_name: "その他",
            tag_info: "",
            tag_body: "")


Style.create(uuid: 1, name: "学ぶ")
Style.create(uuid: 2, name: "交流する")
Style.create(uuid: 3, name: "有料")
Style.create(uuid: 4, name: "無料")
Style.create(uuid: 5, name: "食事付き")


<<<<<<< HEAD
# Student.create(email: "a@gmail.com", password: "666666")
# Student.create(email: "b@gmail.com", password: "666666")
# Student.create(email: "c@gmail.com", password: "666666")
# Student.create(email: "d@gmail.com", password: "666666")
# Student.create(email: "e@gmail.com", password: "666666")
# StudentGroup.create(email: "s@gmail.com", password: "666666")
# StudentGroup.create(email: "a@gmail.com", password: "666666")
# MiniQuestion.create(student_id: 1, check: true, menber_name: "aaa", year: 12, month: 10)
# MiniQuestion.create(student_id: 2, check: true, menber_name: "aaa", year: 12, month: 10)
# MiniQuestion.create(student_id: 3, check: true, menber_name: "aaa", year: 12, month: 10)
# MiniQuestionStudentGroup.create(mini_question_id: 1, student_group_id: 1)
# MiniQuestionStudentGroup.create(mini_question_id: 1, student_group_id: 2)
# MiniQuestionStudentGroup.create(mini_question_id: 2, student_group_id: 2)
=======




>>>>>>> 7c83f9e23d10c3ec552e53fc2a1ec239430b06b5
