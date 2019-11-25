# karam Neating

## Spring Gradle / MySQL / Mybatis

![메인화면](https://user-images.githubusercontent.com/57895491/69517004-c8682180-0f96-11ea-9292-3451ff44adbd.PNG)


### Member

#### SignUp
##### - member_id : 길이 제한
##### - member_password : 길이 제한, 영어+숫자+특수문자 필수
##### - 비밀번호는 SHA-256으로 암호화하여 보안성을 높였다.

![가입](https://user-images.githubusercontent.com/57895491/69517022-d8800100-0f96-11ea-845c-71620da2d9a4.PNG)

#### Search
##### - 회원이 아이디와 비밀번호를 잊어버린 경우에는 SMTP 메일을 통해 메일로 랜덤숫자를 전송하여 그 숫자를 입력하면
##### - 아이디를 검색하거나 비밀번호를 변경할 수 있다.
##### - 상품이나 게시판의 원하는 단어를 이용하여 검색 할 수 있다.

![블라우스 검색](https://user-images.githubusercontent.com/57895491/69517028-dfa70f00-0f96-11ea-9e48-99bc2409a36f.PNG)

##### - 상품을 구매 할 수 있다.

![상품구매](https://user-images.githubusercontent.com/57895491/69517095-0bc29000-0f97-11ea-82ef-83c330a3c951.PNG)

### Manager

#### 회원관리 - 가입된 회원의 목록을 한 눈에 볼 수 있으며 회원 아이디를 검색하여 원하는 회원을 볼 수 있다.
#### 상품관리 - 등록된 상품의 목록을 한 눈에 볼 수 있으며 수정할 수 있다.

![관리자2](https://user-images.githubusercontent.com/57895491/69517074-fc434700-0f96-11ea-9673-e906dec142cc.PNG)

#### 게시판관리 - 등록된 게시글의 목록을 한 눈에 볼 수 있으며 수정할 수 있다.

![관리자3](https://user-images.githubusercontent.com/57895491/69517082-01a09180-0f97-11ea-93b8-09b0859a7898.PNG)


#### 입금목록 - 사용자가 입금한 상품의 목록을 한 눈에 볼 수 있다.

![관리자1](https://user-images.githubusercontent.com/57895491/69517055-f3527580-0f96-11ea-83aa-6abfc70ff998.PNG)

### XSS

#### 스크립트 공격에 대비하여 네이버 lucy를 이용하여 방어하였다.

![게시판1](https://user-images.githubusercontent.com/57895491/69517050-ee8dc180-0f96-11ea-8958-b7ef7caec628.PNG)

### smartEditor

#### 네이버 스마트 에디터를 이용하여 게시판 작성시 쉽고 편하게 작성을 도와준다.





