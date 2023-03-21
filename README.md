# 인하대 투표 웹사이트 개발
인하대 객체지향프로그래밍2 팀 프로젝트

## 팀원 소개
- 최정윤: 팀장, 프로젝트 기획 및 디자인, 개발
- 김초현: 팀원, Git 관리 및 검증, 개발
- 이상호: 팀원, 문서 작성 및 배포, 개발

## 개발 진행 Rule
- 개발건(신규, 버그, 문서 작업) → issue 등록
- 매주 화요일 회의 → 진행 상황 확인, 이슈 담당자/기한 할당
- 개발 진행 및 어려운 부분 다같이 논의

## 이슈 작성법
![image](https://user-images.githubusercontent.com/45556262/225898492-2f623fc5-0bf8-4a1f-ae2a-dfc0f6b22e45.png)
- 제목: [레이블명] 이슈명
- 내용: 구체적으로 적기
- Assignees: 담당자 할당
- ***Labels***
    - feat: 신규 개발
    - fix: 버그 수정
    - docs: 문서 작업
    - study: 공부 필요
    - help: 도움 필요
    - release: 배포 작업

## 브랜치 전략
github flow 채택(git flow에 비해 간단함 → [자세한 건 여기 참고](https://inpa.tistory.com/entry/GIT-%E2%9A%A1%EF%B8%8F-github-flow-git-flow-%F0%9F%93%88-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EC%A0%84%EB%9E%B5))
1. 작업 브랜치 생성: 각자 맡은 이슈를 개발하는 공간
    - branch 레이블/#이슈번호 → `branch feat/#2345`
2. 개발 및 테스트
3. 작업 브랜치를 메인 브랜치에 merge
    - [인텔리제이 방법](https://code-algo.tistory.com/39)
    - [git terminal interface 방법](https://uang.tistory.com/9)

## 커밋 메시지 작성법
```
ex)
feat : 개발환경 세팅

- Spring boot 프로젝트 생성
- git 연동

Issues: #1234
```
