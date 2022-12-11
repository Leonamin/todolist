# 프로젝트 모델
TodoProject
## 개요
- [id](#1-id)
- [name](#2-name)
- [theme](#3-theme)
- [viewType](#4-viewtype)
- [createdAt](#5-createdat)
- [modifiedAt](#6-modifiedat)
- [projectGroupId](#7-projectgroupid)
- [projectClass](#8-projectclass)
- [projectOrder](#9-projectorder)
## 1. id
`int` 프로젝트의 아이디 
## 2. name
`stirng` 프로젝트의 이름
## 3. theme
`Theme` 현재는 프로젝트 색상 정보
### Theme 모델
- color: 컬러 정보
## 4. viewType
`Enum<ProjectViewType>` 프로젝트 보기형식 수직 보기, 수평 보기 등 존재
### Enum\<ProjectViewType\>
- VerticalSimple - 섹션과 작업 목록을 수직으로 간단히 보여준다
- HorizontalSimple - 섹션과 작업 목록을 수평을 간단히 보여준다
- VerticalSpecific - 섹션 목록을 수평으로 작업 목록을 수직으로 보여준다
- HorizontalSpecific - 섹션 목록을 수직으로 작업 목록을 수평으로 보여준다
## 5. createdAt
`int64` 프로젝트 생성일
## 6. modifiedAt
`int64` 프로젝트가 마지막으로 수정된 날짜 이름, 테마 보기 형식 등 프로젝트 정보 뿐만 아니라 섹션, 작업 등 하위 정보들이 생성 수정 삭제 등이 발생해도 바뀐다.
## 7. projectGroupId
`int` 프로젝트 집합의 id 프로젝트가 어떤 프로젝트 집합에 있는지 알려준다.  
집합내에서 최상위 프로젝트일 경우 프로젝트 자신의 id와 동일하다.
## 8. projectClass
`int` 프로젝트 집합내에서 몇번 계층 프로젝트인지 순서 최상위 프로젝트는 1, 아래로 내려갈 수록 숫자가 증가한다.
## 9. projectOrder
`int` 프로젝트 집합내에서 순서 최상위 프로젝트는 최상위 프로젝트끼리의 순서가 된다. 같은 계층에서의 순서이다