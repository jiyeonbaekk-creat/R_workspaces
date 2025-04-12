# Yahoo Finance API를 사용하여 애플의 주가 데이터를 가져옵니다.
import yfinance as yf

# 애플 주가 데이터 다운로드
data = yf.download('AAPL', start='2024-01-01', end='2025-04-10')
# print(data.head())
# 종가(Close), 고가(High), 저가(Low), 시가(Open), 거래량(Volume)

# sklearn 스케일링
from sklearn.preprocessing import MinMaxScaler

# 종가 열 추출 및 정규화
# 종가? 주식 시장에서 하루 동안의 거래가 종료될 때 기록된 마지막 가격
# 보통 수십 달러에서 수백 달러 사이의 값으로 나타나는데, 크기 차이가 클 경우 모델학습과정에 문제가 생김
# 정규화를 통해 모든 데이터 값을 같은 범위(예: 0~1)로 변환
scaler = MinMaxScaler(feature_range=(0, 1))
data['Close'] = scaler.fit_transform(data[['Close']])

