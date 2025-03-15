library(dplyr)
netflix = read.csv('netflix.csv') # 데이터셋 읽기
# 3번
result = netflix %>% select('title','type','release_year')
# print(result)
# 6번
result = netflix %>% 
  filter(type == 'TV Show' & rating == 'TV-MA')
# print(result)
# 7번
result = netflix %>% 
  filter(type == 'Movie' & director == 'Mike Flanagan') %>%
  select(title, director, country)
# print(result)
# 10번
# 문제발생 : 'duration' 컬럼에 숫자와 문자가 존재함.
# 문자열을 제거(특정문자로 대체) -> gsub
# *텍스트 데이터에서 숫자만 추출  뒤 정렬하는게 포인트
result = netflix %>%
  filter(type == "TV Show") %>%
  mutate(seansons  = as.numeric(gsub(' Season[s]?',"",duration))) %>%
  arrange(seansons)
# print(result)
# 퀴즈) 2021년에 제작된 영화의 평균 길이를 구하세요.
# filter
# 평균 : mean
# summarise
# 문자 제거 -> gsub(문자제거) -> as.numeric (형변환)
result = netflix %>%
  filter(type == 'Movie' & release_year == 2021) %>%
  summarise(avg_duraion = mean(as.numeric(gsub(" min","",duration)), na.rm= TRUE))
# View(result)

# 퀴즈) 년도별 제작된 영화의 평균 길이를 구하세요.
# groub_by + summarise
# filter
# mean
# gsub
result = netflix  %>%
  filter(type == "Movie") %>%
  group_by(release_year) %>%
  summarise(avg_duraion = mean(as.numeric(gsub(" min","",duration)) ,na.rm = TRUE))
# View(result)

# 장르가 Comedies인 '영화'의 제목
# listed_in %in% c('Comedies') : listed_in에 Comedies가 포함되었는지 체크해줌
result = netflix %>%
  filter(type == 'Movie' & listed_in %in% c('Comedies'))  %>%
  select(title)
# View(result)

# 'International TV Shows' 장르에 속하고, TV-MA 등급인
# TV Show의 title과 제작 국가를 추출하시오.
result = netflix %>%
  filter(type == 'TV Show' & 
           listed_in %in% c('International TV Shows') &
           rating == 'TV-MA') %>%
 nrow()
# nrow() : 행 개수, number of rows
#  View(result)

# United States에서 제작된 '영화'의 개수 추출
result= netflix  %>%
  filter(type == 'Movie' & country == 'United States') %>%
  nrow()
print(result)

# 국가별 영화 수
# country != ''(빈값 체크하는 방법)
result= netflix  %>%
  filter(type == 'Movie' & country != '') %>%
  group_by(country) %>%
  summarise(count = n())
# View(result)