## GIT



✅ **기본 clone 후 push까지 방법**

1. `git clone "클론할 Repo URL"`

2. `cd directory` ➡️ 클론한 폴더로 이동
3. `git add .`  명령어로 unstage ➡️ stage로 올리기

- `git add "파일이름"` 명령어로 개별 파일 upstage ➡️ stage 올리기도 가능

4. `git commit -m "커밋 메세지 작성"` ➡️ stage파일 커밋 메세지 작성
5. `git push` ➡️ 커밋 remote서버로 push



✅ **Merge 방법**

1. `git checkout -b "브랜치이름"` ➡️ 생성하고 싶은 브랜치를 생성한다.
2. `git add .` ➡️ 원하는 내용 임의로 변경 후 스테이지에 올림
3. `git commit -m "원하는 커밋 메세지"` ➡️ 스테이지에 있는 파일 commit
4. ❗️주의 여기서 `git push` 가 아니야!! 왜냐 **remote** 서버에 **local**에 생성한 브랜치가 없거든 `git push --set-upstream origin master`인가? 명령어로 remote 서버에 브랜치 생성 
5. `git checkout master` ➡️ 꼭 마스터가 아니어도 됨❗️ 병합되어 주가 되길 원하는 브랜치로 이동
6. `git merge "브랜치 이름"` ➡️ 병합되어 지길 원하는 브랜치 이름 입력
7. `master` 브랜치로 `"브랜치 이름"` 브랜치가 머지 됨



✅ **그 외 자주쓰는 명령어**

1. `git status` ➡️ 현재 깃 브랜치의 상태 확인 unstage 파일과 stage 파일
2. `git branch` ➡️ 현재 head 브랜치와 전체 브랜치 목록 확인 가능
3. `git remote -v` ➡️ 현재 git 레포지터리의 리모트 서버 목록 확인 가능





