#じゃんけん数字から文字変換
def chg_jan(jan_type)
    if jan_type == "0" then
        text = "グー"
    elsif jan_type == "1" then
        text = "チョキ"
    elsif jan_type == "2" then
        text = "パー"
    elsif jan_type == "3" then
        text = "戦わない" 
    end
    return text
end
#じゃんけん勝負
def janken(num)
    if num == "1" then
        puts "じゃんけん．．．"
    else
        puts "あいこで．．．"
    end
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    jan_type = gets.chomp.to_s
    jan = chg_jan(jan_type)
    pc_jan = chg_jan(rand(0..3).to_s)
    if num == "1" then
        puts "ホイ！"
    else
        puts "ショ！"
    end
    puts "--------------------"
    puts "あなた：#{jan}を出しました"
    puts "相手　：#{pc_jan}を出しました"
    puts "--------------------"  
    if jan == "戦わない" or pc_jan == "戦わない"  then
        #棄権
        return "abstention"    
    else
        if (jan == "パー" && pc_jan == "チョキ") or (jan == "グー" && pc_jan == "パー") or (jan == "チョキ" && pc_jan == "グー") then
            #負け
            return "lose"
        elsif (jan == "パー" && pc_jan == "グー") or (jan == "グー" && pc_jan == "チョキ") or (jan == "チョキ" && pc_jan == "パー") then   
            #勝ち
            return "win"
        else
            #あいこ
            return "draw"
        end
    end  
end
#あっち向いてホイ数字から文字変換
def chg_hoi(type)
    if type == "0" then
        text = "上"
    elsif type == "1" then
        text = "下"
    elsif type == "2" then
        text = "左"
    elsif type == "3" then
        text = "右" 
    end
    return text
end
#メイン
def main_game()
    #じゃんけん
    #drawの場合は勝負がつくまでループ（初回はdraw）
    jan_result =  "draw"
    #文言調整用（初回は１あいこは２）
    jan_num = "1"
    while jan_result ==  "draw" do
        jan_result = janken(jan_num)
        jan_num = "2"
    end
    if jan_result !=  "abstention" then
        #あっち向いてホイ
        puts "あっち向いて〜"
        puts "0(上)1(下)2(左)3(右)"
        hoi_type = gets.chomp.to_s
        hoi = chg_hoi(hoi_type)
        pc_hoi = chg_hoi(rand(0..3).to_s)
        puts "--------------------"
        puts "あなた：#{hoi}"
        puts "相手　：#{pc_hoi}"
        puts "--------------------"
        if jan_result == "win" && hoi == pc_hoi then
            #勝ち
            puts "あなたの勝ち"
            return true
        elsif jan_result == "lose" && hoi == pc_hoi then
            #PCの勝ち
            puts "相手の勝ち" 
            return true   
        else
            return false
        end
    else
        #棄権
        return true 
    end
end

#ゲーム
#棄権・勝敗がつく：true
flg =false
while flg == false  do
    flg = main_game()
end