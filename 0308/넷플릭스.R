# install.packages("dplyr") # 설치
library(dplyr)
# setwd('D:/r-data') # 작업 디렉토리 변경
# print(list.files()) # R 경로확인
netflix = read.csv('netflix.csv')
# View(netflix)
# 문제 1: 데이터프레임의 앞부분 출력 단, 2행만
result = head(netflix, 2)
print(result)
# 문제 2: 데이터프레임의 뒷부분 출력 단, 5행만
result = tail(netflix, 5)
print(result)
# 문제 3: 데이터프레임의 구조 확인
str(netflix)
#문제 4: 특정 열 title 선택하기
