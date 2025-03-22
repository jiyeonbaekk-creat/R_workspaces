library(dplyr)
library(ggplot2)

setwd('D:/r-data')
bicycle_data = read.csv('seoul_public_bicycle_data.csv', fileEncoding = 'CP949',
                        encoding = "UTF-8",
                        check.names = FALSE)
# View(bicycle_data)

# 1. 대여소번호별 이용건 수 막대그래프 표현.
# (x축 : 대여소번호 , y축: 이용건 수)
p = ggplot(data = bicycle_data, aes(
  x = "대여소번호",
  y = "이용건 수",)) +
  geom_col(fill = "green") +
  labs(
    title = "대여소번호 별 이용건 수",
    x = "대여소번호",
    y = "이용건 수"
  )
print(p)
# 2. 정기권을 구매한 이용자 중 연령대 별 평균 운동량 막대그래프로 표현.
# 단, 이용시간(분) 5분 이하는 평균에서 제외
# (x축 : 연령대, y축: 평균 운동량)

# 3. 연령대코드 별 이용시간과 운동량을 비교하는 산점도 그래프 표현.
# (x축 : 이용시간, y축: 운동량 )
# 조건 1. 연령대 별 색깔 (10대 : 노랑(yellow), 20대 : 블루(blue), 30대 : 퍼플(purple), 40대: 초록(green), 50대 : 블랙(black))
## 난이도 업(할 수 있는사람만)
# 조건 2. 연령대 별 중 운동량을 스케일(minmax) 후 0.5 이상인 회원은 세모표시(17)
# ***그래프 3개 저장할 것