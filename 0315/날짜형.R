Sys.setlocale("LC_TIME", "C") # 임시로 장소 변경

date_str = 'September 24, 2021'
# R은 해당 문자를 바로 날짜형으로 변환할 수 없다.
date_str = as.Date(date_str, format = '%B %d, %Y') # 형식 맞추기
print(date_str)
formatted_date = format(date_str, '%Y') # 년도만 나오게
print(formatted_date)

date_str_1 = '2025-03-15'
date

# 퀴즈) 2021년에 추가된 영화의 타이틀 추출[응용]
# 1. formatted_add_date 컬럼(벡터)추가
# 2. %B %d, %Y형태로 포맷한 나짜 형변환
netflix  = netflix %>% 
  mutate(formatted_add_date=
           as.Date(date_added, format = '%B %d, %Y'))
# View(netflix) # 컬럼 추가 확인

result = netflix %>%
  filter(type == 'Movie'
         & format(formatted_add_date, '%Y') == 2021) %>%
  select(title)
# View(result) #21년도에 넷플릭스 추가된
