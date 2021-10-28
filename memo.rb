require "csv"
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.chomp.to_s
puts "拡張子を除いたファイル名を入力してください"
memo_file = gets.chomp.to_s
puts "メモしたい内容を記入してください"
puts "完了したらCtrl + Dをおします"
memo_text = readlines

if memo_type == "1" then
    #入力にカンマ無しバージョン
    texts = []
    for i in 0...memo_text.length
        texts[i] = memo_text[i].to_s.chomp
    end
    in_csv = CSV.open(memo_file + '.csv','w')
    in_csv.puts texts
    in_csv.close
elsif memo_type == "2" then
    #入力にカンマ無しバージョン
    texts = []
    for i in 0...memo_text.length
        texts[i] = memo_text[i].to_s.chomp
    end
    in_csv = CSV.open(memo_file + '.csv','a')
    in_csv.puts texts
    in_csv.close
end