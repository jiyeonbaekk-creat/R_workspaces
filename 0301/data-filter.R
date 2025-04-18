### *****가장 중요한 부분
### 데이터분석 80~90  필터링(전처리)
# 필터링 -> 쓸모없는 데이터 거르기
# 1. subset
# 2. ****dplyr(디플라이어)
# 디플라이어 장점
# 문제를 더 빨리 풀 수 있고
# 실무에서 많이 사용함

## subset (부분집합)
# 특정 조건에 맞는 데이터를 추출하여
# 새로운 부분집합을 만드는 기능
# subset 설치할 필요없음, R에서 기본으로 제공해줌
# 디플라이어는 설치해야함
emp = read.csv('emp.csv')
print(emp)
# 급여가 3000 이상 받는 사원만 조회
high_sal = subset(emp, SAL >= 3000)
print(high_sal)  #SCOTT, KING
# AND 연산자, OR연산자를 이용해서 여러조건을 결합
# 급여가 3000이상, 부서번호가 20번인 직원만
emp_deptno20 = subset(emp, SAL >= 3000 & DEPTNO == 20)
print(emp_deptno20)

# 급여가 2000 이상인 직원의 이름하고 입사날짜, 직책 조회
emp_sal2000 = subset(emp, SAL >= 3000, select
                     = c(ENAME,JOB,SAL))
print(emp_sal2000)

# 설치
#istall.packages('dylyr')

# 설치한 디플라이어를 스크립트창에 가져와야함.
# 로드(임포트)
library(dplyr)
### *****디플라이어 핵심문법
# 1. filter : 조건에 맞는 행 조회
# 2. select : 특정 컬럼(열) 선택
# 3. mutata : 새로운 컬럼 추가
# 4. arrange : 행 정렬
# 5. group by : 데이터 그룹화
# 6. summarise : 통계 계산
# 7. join : 여러 데이터프레임 병합
# 8. slice : 특정 행 선택



# 디플라이어(dplyr) : data frame plier(공구)
# 데이터프레임을 다루는 '공구'
# 대규모 데이터 처리할 때 매우 빠른 속도를 제공합니다.
# 실무에서 전처리 작업할 때 자주 사용됩니다.

# filter
# 행을 조건에 따라 필터링
# 급여가 3000 이상인 직원 조회
high_salary = emp%>%filter(SAL >= 3000)
print(high_salary)
# 급여가 3000이상이고 부서번호가 20번인 사원 조회
high_salary_20 = emp %>% filter(SAL >= 3000 & DEPTNO)
print(high_salary_20)
# 부서번호(DEPTNO)가 20번이고, 직책(JOB) 'MANAGER'인 사원 조회
emp_20 = emp %>% filter(DEPTNO == 20 & JOB == 'MANAGER')
print(emp_20)
# 급여가 2000 미만이고, 부서번호가 20번인 사원 조회
emp_20 = emp %>% filter(SAL < 2000 & DEPTNO == 20)
print(emp_20) # SMITH, ADAMS

# 위 문제에서 사원이름, 부서번호만 조회
emp_20 = emp %>% filter(SAL < 2000 & DEPTNO == 20) %>% select(ENAME,DEPTNO)
print(emp_20)

# 직책(JOB)이 'SALESMAN'인 사원의 이름,직책,입사날짜 조회
emp_manager = emp %>% filter(JOB == 'SALESMAN')%>%select(ENAME,JOB,HIRE)
print(emp_manager)
