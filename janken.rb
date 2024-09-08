# あっち向いてホイ処理
def acci_muite_hoi(janken_result)
    loop do
    puts "あっち向いて〜"
    puts "０（上）１（下）２（左）３（右）"
    player_way = gets.chomp.to_i

    player_choice = case player_way
                    when 0 then "上"
                    when 1 then "下"
                    when 2 then "左"
                    when 3 then "右"
                    else
                        "不正な値"
    end

    if player_choice == "不正な値"
        puts "０から３の数字を入力してください"
        next
    end

    puts "ホイ！"

        opponent_way = ["上","下","左","右"].sample
    
        puts "--------------"
        puts "あなた：#{player_choice}"
        puts "相手：#{opponent_way}"
        puts "--------------"

        if player_choice == opponent_way
            if janken_result == "勝ち"
                puts "あなたの勝ちです！"
                puts "勝負を終了します"
                return "勝敗決定"
            else
                puts "相手の勝ちです"
                puts "勝負を終了します"
                return "勝敗決定"
            end
        else
            puts "もう一回！"
            return       
        end
    end
end

# じゃんけんループのラウンド処理
def janken_loop
    first_round = true
    loop do
        puts "0（グー）1（チョキ）2（パー）3（戦わない）"

        player_input = gets.chomp.to_i

        player_hand = case player_input
              when 0 then "グー"
              when 1 then "チョキ"
              when 2 then "パー"
              when 3 then "戦わない"
              else
                 "不正な値"
        end

        if player_hand == "戦わない"
            puts "じゃんけんを終了します"
            exit
        end
    
        if player_hand == "不正な値"
            puts "０,１,２,３のいずれかを入力してください"
            next
        end


        opponent_hand = ["グー","チョキ","パー"].sample

        result = if player_hand == opponent_hand
                    "あいこ"
                elsif (player_hand == "グー" && opponent_hand == "チョキ") ||
                      (player_hand == "チョキ" && opponent_hand == "パー") ||
                      (player_hand == "パー" && opponent_hand == "グー") 
                    "勝ち"
                else
                    "負け"
                end

        # じゃんけん結果
        yield first_round, result

        puts "--------------"
        puts "あなた：#{player_hand}を出しました"
        puts "相手：#{opponent_hand}を出しました"
        puts "--------------"

        if result == "あいこ"
            first_round = false
            puts "あいこで..."
            next
        else
            return result
        end
    end
end

# じゃんけんループ
loop do
puts "じゃんけん..."

janken_result = janken_loop do |first_round,result|
    if first_round
        puts "ホイ！"
    else
        puts "ショ！"
    end
end

result = acci_muite_hoi(janken_result)
    if result == "勝敗決定"
        break
    end
end