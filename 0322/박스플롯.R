# 박스플롯(Box-plot)?
# 데이터 분포를 시각적으로 나타내는 그래프
# 데이터의 '최솟값, 최댓값, 1사분위수, 중앙값 ....
# 등 요약 통계치를 보여줍니다.
# 예) 1. 학생들의 시험 성적을 분석할 때
# -> 각 반 또는 학년별 성적 분포를 비교할 때 유용
# 2. 제조업에서 생상 공정 데이터 분석할 때
# -> 각 기계의 출력 값이 정상 범위를 벗어나는지 확인할 때
# 유용

# 나이 별 소득 박스플롯으로 표현하기
library(ggplot2)
library(dplyr)

people = read.csv('age_income.csv')
# View(people)

# 연령별 분류 필터링
people = people %>%
  mutate(ageg = ifelse(age < 30, 'young',
                       ifelse(age <= 59, "middle","old")))
# View(people)


# 연령대 별 income 평균
# !is.na : 결측값이 아니라면?
# is.na : 결측값 이라면?
avg_income = people %>% filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

# 박스플롯 생성
p = ggplot(data = people, aes(x = ageg
                                  , y = income
                                  , fill = ageg)) +
  geom_boxplot() +  # 박스플롯 생성
  labs(title = "연령대 별 수입 분포",
       x = "연령대",
       y ="수입") +
  scale_x_discrete(
    limits = c("young","middle","old")
  ) + # discrete : 분리하다
  theme_minimal() # 뒤 회색배경 제거
print(p)