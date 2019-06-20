# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chara.create([
  {name: '킨엣지', job: '어쌔신', species1: '퍼펫'},
  {name: '히에로펀트', job: '블라스터', species1: '사이커'},
  {name: '바즈라', job: '가디언', species1: '워커'},
  {name: '스나이퍼', job: '롱샷', species1: '마린'},
  {name: '메딕', job: '지원가', species1: '마린'},
  {name: '아이언버드라이더', job: '롱샷', species1: '라이더'},
  {name: '엔지니어', job: '지원가', species1: '에어포스'},
  {name: '머로더', job: '블라스터', species1: '메크'},
  {name: '오큘러스', job: '스페셜리스트', species1: '인섹토이드'},
  {name: '레이저클로', job: '어쌔신', species1: '비스트'},
  {name: '판다몽크', job: '뱅가드', species1: '판다'},
  {name: '터스커', job: '뱅가드', species1: '비스트'},
  {name: '일루셔니스트', job: '서머너', species1: '퍼펫', species2: '사이커'},
  {name: '찬터', job: '지원가', species1: '사이커'},
  {name: '사이렌', job: '어쌔신', species1: '크라켄'},
  {name: '블레이드마스터', job: '뱅가드', species1: '퍼펫'},
  {name: '스카이크랩', job: '시즈브레이커', species1: '크라켄'},
  {name: '고릴라', job: '블라스터', species1: '메크'},
  {name: '드래곤브레스', job: '뱅가드', species1: '마린'},
  {name: '파비저', job: '가디언', species1: '마린'},
  {name: '카미카제', job: '블라스터', species1: '인섹토이드'},
  {name: '애시드투스', job: '뱅가드', species1: '비스트'},
  {name: '다이어윙', job: '롱샷', species1: '랩터'},
  {name: '바인워든', job: '스페셜리스트', species1: '이모탈'},
  {name: '썬더러', job: '롱샷', species1: '사이커'},
  {name: '슬래셔', job: '뱅가드', species1: '퍼펫'},
  {name: '스톰쿨러', job: '스페셜리스트', species1: '크라켄'},
  {name: '아랏', job: '롱샷', species1: '워커'},
  {name: '캐터펄트', job: '시즈브레이커', species1: '메크'},
  {name: '아웃라이더', job: '블라스터', species1: '라이더'},
  {name: '돈틀레스', job: '블라스터', species1: '에어포스'},
  {name: '코만도', job: '롱샷', species1: '마린'},
  {name: '모투스', job: '어쌔신', species1: '에어포스'},
  {name: '드레드포', job: '서머너', species1: '비스트'},
  {name: '스파이더', job: '스페셜리스트', species1: '인섹토이드'},
  {name: '수리검판다', job: '어쌔신', species1: '판다'},
  {name: '골드만', job: '가디언', species1: '비스트'},
  {name: '불사조', job: '블라스터', species1: '랩터', species2: '스페셜리스트'},
  {name: '불워크', job: '가디언', species1: '퍼펫'},
  {name: '템페스트키퍼', job: '시즈브레이커', species1: '워커'},
  {name: '수메루', job: '서머너', species1: '크라켄', species2: '퍼펫'},
  {name: '워브링어', job: '가디언', species1: '퍼펫'},
  {name: '폭탄병', job: '스페셜리스트', species1: '마린'},
  {name: '센티넬', job: '어쌔신', species1: '메크'},
  {name: '크루저', job: '시즈브레이커', species1: '에어포스'},
  {name: '소울멘토', job: '지원가', species1: '비스트'},
  {name: '하이브퀸', job: '롱샷', species1: '인섹토이드'},
  {name: '이글', job: '뱅가드', species1: '랩터', species2: '비스트'},
  {name: '본드래곤', job: '시즈브레이커', species1: '랩터', species2: '이모탈'},
  {name: '찬마스터', job: '스페셜리스트', species1: '판다'},
  {name: '웨일', job: '시즈브레이커', species1: '크라켄'},
  {name: '헤일스톰', job: '블라스터', species1: '메크'},
  {name: '디바우러', job: '스페셜리스트', species1: '랩터'},
  {name: '트렌트', job: '뱅가드', species1: '이모탈'},
  {name: '블랙터틀', job: '가디언', species1: '사이커'}

])
#
# #직업
# 가디언 = ["바즈라","파비저","골드만","불워크","워브링어"]
# 블라스터 = ["히에로펀트","머로더","고릴라","카미카제","아웃라이더","돈틀레스","불사조","헤일스톰"]
# 지원가 = ["메딕","엔지니어","찬터","소울멘토"]
# 롱샷 = ["스나이퍼","아이언버드라이더","다이어윙","썬더러","아랏","코만도","하이브퀸"]
# 시즈브레이커 = ["스카이크랩","캐터펄트","템페스트키퍼","크루저","본드래곤","웨일"]
# 스페셜리스트 = ["오큘러스","바인워든","스톰쿨러","스파이더","폭탄병","찬마스터","디바우러"]
# 어쌔신 = ["킨엣지","레이저클로","사이렌","모투스","수리검판다","센티넬"]
# 서머너 = ["일루셔니스트","드레드포","수메루"]
# 뱅가드 = ["판다몽크","터스커","블레이드마스터","드래곤브레스","애시드투스","슬래셔","이글","트렌트"]
#
# #종족
# 마린 = ["스나이퍼","메딕","드래곤브레스","파비저","코만도","폭탄병"]
# 라이더 = ["아이언버드라이더","아웃라이더"]
# 메크 = ["머로더","고릴라","캐터펄트","센티넬","헤일스톰"]
# 에어포스 = ["엔지니어","돈틀레스","모투스","크루저"]
# 퍼펫 = ["킨엣지","일루셔니스트","블레이드마스터","슬래셔","불워크","수메루","워브링어"]
# 사이커 = ["히에로펀트","일루셔니스트","찬터","썬더러"]
# 워커 = ["바즈라","아랏","템페스트키퍼"]
# 크라켄 = ["사이렌","스카이크랩","스톰쿨러","수메루","웨일"]
# 비스트 = ["레이저클로","터스커","애시드투스","드레드포","골드만","소울멘토","이글"]
# 랩터 = ["다이어윙","불사조","이글","본드래곤","디바우러"]
# 인섹토이드 = ["오큘러스","카미카제","스파이더","하이브퀸"]
# 이모탈 = ["바인워든","본드래곤","트렌트"]
# 판다 = ["판다몽크","수리검판다","찬마스터"]
