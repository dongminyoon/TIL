## gitignore 설정이 되지 않는 경우

<br>

 분명히 `.gitignore`파일을 설정했음에도 해당 파일이 업로드 되는 상황이 있다. 이때의 대처방법이다.

 즉, ignore 처리된 파일이 ***stage에 올라가는 상황***이다.

>  구글링을 통해 알아보니 git의 캐시가 남아있기 때문에 `.gitignore`가 반영되지 않는 상황이라고 했다. 이를 해결하기 위해 git cache을 삭제해주고 다시 반영해주면 된다.

<br>

1️⃣ git rm -r --cached .

2️⃣ git add .

3️⃣ git commit -m "fixed: .gitignore 재설정"

