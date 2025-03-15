library(dplyr)
netflix = read.csv('netflix.csv') # 데이터셋 읽기

result = netflix  %>%
  filter(type == "Movie") %>%
  mutate(avg_duraion = as.numeric(gsub(" min","",duration))) 
# View(result)

result = netflix  %>%
  filter(type == "Movie") %>%
  group_by(release_year) %>%
  summarise(avg_duraion = mean(as.numeric(gsub(" min","",duration)) ,na.rm = TRUE))
# View(result)

# 국가별 영화 수
# country != '' (빈값 체크하는 방법)
result = netflix %>%
  filter(type == 'Movie' & country != '') %>%
  group_by(country) %>%
  summarise(count = n())
# View(result)

# 국가별 영화 수 -> 가장 영화가 많은 국가(상위 5개만 추출)
# 등수 구하는 분석할 때 '정렬'
result = netflix %>%
  filter(type == 'Movie' & country != '') %>%
  group_by(country) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  slice_head(n = 5) #  상위 5개

# View(result)

# 감독별 가장 많이 넷플릭스에 등록한 감독 상위 1명 조회
# ~별 : group_by + summarise
#  등수 -> 정렬(arrange)
top_director = netflix %>%
  filter(director != '') %>%
  group_by(director) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  slice_head(n = 1)
# View(top_director)

# 넷플릭스 가장 많이 등장하는 장르 상위 5개
# group_by
# install.packages("tidyr")
library(tidyr) # <- separate_rows(사용가능)
# separate_rows : 디플리알 문법X
# 콤마로 구분된 문자열 처리할  때
# separate : 분리하다
# ***separate_rows(listed_in, sep = ", ")
# => listed in 분리할꺼야! sep = ", " <- 요기준으로
# 분리 부탁해~!
# sep : separate
top_genre = netflix %>%
  separate_rows(listed_in,sep = ", ") %>%
  group_by(listed_in) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  slice_head(n = 5)

# View(top_genre)

# 4교시
result = netflix %>%
  select(date_added) %>%
  slice_head(n = 5)
# View(result)


