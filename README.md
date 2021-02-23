# academicManagement
*Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;eclipse*   
*Server&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;apache Tomcat*   
*DB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;MySQL*   
*front-end&nbsp;:&nbsp;HTML,CSS,JavaScript*   
*back-end&nbsp;&nbsp;:&nbsp;JSP*   
*ajax를 이용한 화면 일부 갱신*   
***
*login : 로그인 로직*
*main  : 로드인 성공 로직*

*그림에 대한 설명은 그림 밑을 참고*
***
## 기능
사용자는 관리자, 교수, 학생으로 나눠진다. 등록된 사용자만 서비스를 사용할 수 있다.   
   관리자(id:root,pw:root,name:root,level:root)   
    - 관리자계정은 default로 만들어져 있어 따로 만들 수 없다.   
    - 관리자는 사용자 계정을 만들 수 있다.   
    - 관리자는 장학관리에서 장학생 등록, 장학선발열람, 장학생현황열람 기능을 수행할 수 있다.   
    - 관리자는 수강관리에서 강의계획서등록, 강의계획서열람 기능을 수행할 수 있다.   
    - 관리자는 성적관리에서 성적처리 성적표열람, 성적표관리 기능을 수행할 수 있다.   
    - 관리자는 교과관리에서 교과정보등록, 교과정보관리(삭제, 업데이트), 교과정보열람,수강시간표열람 기능을 수행할 수 있다.   
    - 관리자는 학적관리에서 학적기본, 학적조회 기능을 수행할 수 있다.   
   교수(id:root제외,pw:제한없음,name:제한없음,level:professor)   
    - 교수는 장학관리에서 장학선발열람, 장학생현황열람 기능을 수행할 수 있다.   
    - 교수는 수강관리에서 강의계획서등록, 강의계획서열람 기능을 수행할 수 있다.   
    - 교수는 겅적관리에서 성적처리, 성적표열람, 성적표관리 기능을 수행할 수 있다.   
    - 교수는 교과관리에서 교과정보등록, 교과정보관리, 교과정보열람 기능을 수행할 수 있다.   
   학생(id:root제외,pw:제한없음,name:제한없음,level:student)    
    - 학생은 장학관리에서 장학선발열람, 장학생현황열람 기능을 수행할 수 있다.   
    - 학생은 수강관리에서 강의계획서열람, 수강신청 기능을 수행할 수 있다.   
    - 학생은 성적관리에서 성적열람 기능을 수행할 수 있다.   
    - 학생은 교과관리에서 교과정보열람, 수강시간표열람 기능을 수행할 수 있다.   
    - 학생은 학적관리에서 학적조회 기능을 수행할 수 있다.   
***

## 관리자, 교수, 학생 각각 로그인할 때 출력되는 화면
*관리자*
![관리자 전체화면](https://user-images.githubusercontent.com/34391309/108808677-79ba9480-75ea-11eb-9f18-45d6543f9296.png)
***
*교수*
![교슈전체화면](https://user-images.githubusercontent.com/34391309/108808685-7aebc180-75ea-11eb-9390-4ea89d5b088c.png)
***
*학생*
![학생전체화면](https://user-images.githubusercontent.com/34391309/108808684-7aebc180-75ea-11eb-89e8-f1a53a9b88d5.png)
***
## 1. 관리자
### 1) 관리자 계정은 default로 만들어져 있어 따로 만들 수 없다.
![로그인 화면](https://user-images.githubusercontent.com/34391309/108803744-c5ffd780-75de-11eb-83d6-a7611dbff426.png)   
관리자가 관리자 계정으로 로그인하는 화면
***
![관리자 로그인 성공화면](https://user-images.githubusercontent.com/34391309/108803741-c5674100-75de-11eb-85d7-2608f1208f1d.png)
로그인이 성공할 때 나오는 화면, 각 기능들이 좌측에 나열되어 있다.
***
### 2) 관리자는 사용자 계정을 만들 수 있다.
![사용자 계정 생성](https://user-images.githubusercontent.com/34391309/108804048-956c6d80-75df-11eb-8a4e-43b111b3eb8a.png)   
사용자 생성을 누르면 위와 같은 화면이 나온다. id,pw,name,level를 입력해서 계정을 생성할 수 있다.
***
![회원 추가 성공](https://user-images.githubusercontent.com/34391309/108804051-96050400-75df-11eb-833b-213987710aaf.png)   
계정 성공적으로 추가됐으면 alert으로 띄워준다. 같은 id가 있을 경우에는 추가 실패를 띄워준다.
***
![회원생성 디비 화면](https://user-images.githubusercontent.com/34391309/108804054-969d9a80-75df-11eb-9a15-959c0f3a9e50.png)   
계정 정보가 DB에 저장된것을 확인할 수 있다.
***
### 2) 관리자는 장학관리에서 장학생 등록, 장학선발열람, 장학생현황열람 기능을 수행할 수 있다.
![장학생등록](https://user-images.githubusercontent.com/34391309/108804609-1841f800-75e1-11eb-8eb3-7ff68ff2f21c.png)   
장학생등록 클릭하면 장학생등록화면이 출력이 돼고 학번을 입력하면 추가할 수 있다.
***
![장학생얻을금액및등급](https://user-images.githubusercontent.com/34391309/108804606-1710cb00-75e1-11eb-84ec-5fd1f1512b4a.png)   
해당 장학생이 얻을 수 있는 금액과 등급을 입력한다.
***
![장학생현황DB](https://user-images.githubusercontent.com/34391309/108806077-0f065a80-75e4-11eb-8d1a-eba0304afa0e.png)   
정보가 DB에 정장된것을 확인할 수 있다.
***
![장학생현황확인](https://user-images.githubusercontent.com/34391309/108804608-1841f800-75e1-11eb-9be0-7f6c563bf900.png)   
현재 장학생 현황을 확인할 수 있다.
***
### 3) 관리자는 수강관리에서 강의계획서등록, 강의계획서열람 기능을 수행할 수 있다.  
*강의계획서를 등록하기 위해서는 교과정보가 먼저 등록되어 있어야 한다.*
***
![강의계획서 등록](https://user-images.githubusercontent.com/34391309/108806075-0f065a80-75e4-11eb-84eb-7a37fe7b3a87.png)   
학수번호랑 개요를 입력하면 강의계획서를 등록할 수 있다.
***
![강의계획서열람](https://user-images.githubusercontent.com/34391309/108806073-0e6dc400-75e4-11eb-9b03-1dbfa5cdf26a.png)   
학수번호를 입력하면 강의계획서 열람할 수 있다.
***
![강의계획서DB](https://user-images.githubusercontent.com/34391309/108806078-0f9ef100-75e4-11eb-99f2-f935057f3856.png)   
강의계획서가 DB에 저장된것을 확인할 수 있다.
### 4) 관리자는 성적관리에서 성적처리 성적표열람, 성적표관리 기능을 수행할 수 있다.
*성적처리를 하기 위해서는 수강한 학생이 있어야 한다.*
![성적처리](https://user-images.githubusercontent.com/34391309/108806660-a6b87880-75e5-11eb-9c6d-ac08025b5afd.png)   
학생의 학번, 과목번호,성적,등급을 입력하면 성적이 저장된다.
***
![성적DB](https://user-images.githubusercontent.com/34391309/108806656-a61fe200-75e5-11eb-96a4-e76542dbee74.png)   
성적이 DB에 저장된것을 확인할 수 있다.
***
![성적표열람](https://user-images.githubusercontent.com/34391309/108806653-a5874b80-75e5-11eb-8691-66907ebaed80.png)   
성적표를 열람할 수 있다.
***
![성적표삭제및 수정](https://user-images.githubusercontent.com/34391309/108806663-a7510f00-75e5-11eb-9a78-fdda22640f7d.png)   
학번이랑 과목번호를 입력하면 삭제할 수 있다.
학번이랑 과목번호, new점수, new등급을 입력하면 성적을 업데이트할 수 있다.
***
![성적표 삭제](https://user-images.githubusercontent.com/34391309/108806661-a6b87880-75e5-11eb-9e02-3bbaaab14f14.png)   
삭제된것을 확인할 수 있다.
***
![성적표수정결과화면](https://user-images.githubusercontent.com/34391309/108806662-a7510f00-75e5-11eb-9a83-5909a5a8bf10.png)   
수정된것을 확인할 수 있다.

### 5) 관리자는 교과관리에서 교과정보등록, 교과정보관리(삭제, 업데이트), 교과정보열람,수강시간표열람 기능을 수행할 수 있다.
![교과정보등록](https://user-images.githubusercontent.com/34391309/108807750-82aa6680-75e8-11eb-8b4b-4ee25a1da9b4.png)   
과목번호, 과목이름, 교수이름, 강의시간을 입력하면 교과 정보가 등록된다.
***
![교과정보DB](https://user-images.githubusercontent.com/34391309/108807747-8211d000-75e8-11eb-836f-54969196eb85.png)   
교과정보가 등록된것을 DB에서 확인할 수 있다.
***
![교과정보열람](https://user-images.githubusercontent.com/34391309/108807752-82aa6680-75e8-11eb-8173-a0f96f49b828.png)   
등록된 교과정보를 열람할 수 있다.
***
![교과정보삭제및업데이트](https://user-images.githubusercontent.com/34391309/108807755-8342fd00-75e8-11eb-8cff-2c4eb1574ea8.png)   
과목번호를 입력하면 과목을 삭제할 수 있다. 하지만 해당 과목을 수강하고 있는 학생이 없어야한다. 수강중인 학생이 있을경우 삭제 실패한다.   
학수번호, new과목이름, new교수이름,new강의시간을 입력하면 교과정보를 업데이트할 수 있다.   
교과정보삭제및업데이트는 성적표관리랑 같은 방법이기에 결과화면을 생략   
***
### 6) 관리자는 학적관리에서 학적기본, 학적조회 기능을 수행할 수 있다.
해당 기능은 기타 등록 열람 기능이랑 같은 방법으로 이루어져 있기 때문에 

## 2. 교수
*교수가 할 수 있는 기능은 모두 관리자 기능에 포함되어 있다. 교수가 할 수 없는 기능은 화면에 나와 있지 않다.*
***
## 3. 학생
*학생이 할 수 있는 기능은 모두 관리자 기능에 포함되어 있다. 학생이 할 수 없는 기능은 화면에 나와 있지 않다. 단 수강신청은 학생만이 할 수 있다.*
### 수강신청
![수강신청](https://user-images.githubusercontent.com/34391309/108808681-7a532b00-75ea-11eb-87cf-69abfff88236.png)   
과목번호를 입력하면 해당 과목을 수강할 수 있다.
***
![수강신청DB](https://user-images.githubusercontent.com/34391309/108808680-7a532b00-75ea-11eb-9bb5-949f7bb7436c.png)   
학생번호랑 과목정보가 매칭된것을 DB에서 확인할 수 있다.
