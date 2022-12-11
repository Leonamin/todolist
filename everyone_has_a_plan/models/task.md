# 작업 모델
TodoTask
## 개요
- [id](#1-id)
- [projectId](#2-projectid)
- [sectionId](#3-sectionid)
- [title](#4-title)
- [content](#5-content)
- [createdAt](#6-createdat)
- [modifiedAt](#7-modifiedat)
- [isCompleted](#8-iscompleted)
- [deadline](#9-deadline)
- [priority](#10-priority)
- [alarmList](#11-alarmlist)
- [taskGroupId](#12-taskgroupid)
- [taskGroupClass](#13-taskgroupclass)
- [taskOrder](#14-taskorder)

## 1. id
`int` 작업의 고유 아이디
## 2. projectId
`int` 작업이 소속된 프로젝트 아이디
## 3. sectionId
`int` 작업이 소속된 섹션 아이디 소속된 섹션이 없으면 0
## 4. title
`string` 작업의 제목 255자 제한
## 5. content
`string` 작업의 세부 내용
## 6. createdAt
`int64` 작업이 생성된 날짜
## 7. modifiedAt
`int64` 작업이 수정된 날짜 작업 속성이 바뀌면 바뀐다.
## 8. isCompleted
`bool` 작업이 완료되었는지 구분 true 완료 false 미완료
## 9. deadline
`int64` 작업이 마감되는 날짜
## 10. priority
`int` 작업의 우선순위 그냥 1,2,3,4로 할 예정
## 11. alarmList
`stirng` 미정 정안되면 json으로 저장해서 파싱
## 12. taskGroupId
`int` 작업 그룹의 아이디 최상위 작업은 자기 자신의 아이디 그 아래는 소속된 그룹 최상위 작업의 아이디
## 13. taskGroupClass
`int` 작업 그룹 내부에서 몇번째 계층인지 구분 최상위는 1
## 14. taskOrder
`int` 작업 그룹의 내부 순서 같은 계층 내에서 순서대로 증가한다. 가장 처음은 1