## Mac 초기 셋팅

<br>

#### **Terminal 커스텀 하기**

 맥의 CLI인 **Terminal**을 커스텀 해보자.

* **iTerm2**
* **zsh, oh-my-zsh shell**

<br>

***

✅ **iTerm2**

<br>

🔵 **iTerm2 설치방법 2가지**

1. **[iTerm2 설치](https://iterm2.com/)** 홈페이지로 들어가서 설치
2. **homebrew** 설치 후, `brew cask install iterm2` 명령어 실행

<br>

🔵 **iTerm2 테마 적용**

 [iTerm2 여러 테마](https://github.com/mbadolato/iTerm2-Color-Schemes) 중 원하는 테마를 선택한다. 선택 후, 다운로드한다.

1. iTerm2 실행 후, (`⌘` + `,`) 설정창에서 `Profile`항목의 `Color`탭을 선택한다.

<img src="../images/iTerm2Theme.png" height="400px"/>

2. 우측 하단의 `Color Presets...` 메뉴의 `Import`항목을 선택 후,  다운받은 iTerm2 테마를 선택한다. 다운받은 테마란 *Schemes*의 ***.itemcolors*** 확장자로 된 파일이다.
3. `Import`가 완료된 후, `Color Presets...`메뉴에서 import한 테마를 선택한다.

<br>

***

✅ **zsh**, **oh-my-zsh** 이용 shell 바꾸어서 기능 설정

 Mac OS의 Terminal 기본 Shell은 `Bash(Bourne-again)`이다. 이것을 `zsh Shell`로 바꾸어줄 것이다. 우선 ***Homebrew***을 설치하여 준다.

**방법**

1. ***[HomeBrew](https://brew.sh/index_ko)*** 홈페이지에 접속하여 설치하는 법을 보고 따라한다.

> ➡️ ***Homebrew란?*** 맥북의 패키지 관리자. 즉, 원하는 프로그램들을 명령어로 쉽게 설치하고 삭제하고 업데이트할 수 있게 도와준다.

2. ***Homebrew***설치가 완료되었으면 `zsh`을 설치하여 준다.

```shell
brew install zsh
brew install zsh zsh-completions
```

3. `zsh`의 설정을 쉽게 하게 관리해주는 `oh-my-zsh` 역시 설치한다.

```shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

<br>

🔵 **PROMPT 설정**

 Terminal을 사용하다보면 `yundongmin@yundongmin-ui-Macbook-Pro`와 같은 부분이 Shell앞에 표시되어 불편하다. 이 부분을 ***prompt***라고 부른다. 이 부분을 수정하기 위한 작업이있다.

1. `vi ~/.zshrc` 실행
2. 다음과 같은 명령어를 채운다.

```shell
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

// 여기서 만약 유저이름을 전부 숨기고 PROMPT 부분에 아무것도 표시하고 싶지 않으면 {} 사이에 아무 것도 넣지 않는다.
prompt_context() {}

```

	3. 설정이 완료되었으면 `source ~/.zshrc`로 재실행시킨다.

![prompt](../images/promptZsh.png)

<br>

🔵 **CLI Application 설정**

1. **vim**

> **vim**은 기본으로 CLI의 텍스터 Editor로 생각할 수 있다. **vi**는 `Visual display Editor`에서 유래되었다. **vim**은 `VI Improved`에서 나왔다. 즉, **향상된 vi**을 의미한다고 볼 수 있다.

<br>

👉 **vim** 커스텀을 위한 **neovim**설치

 내장된 vim 대신 사용할 neovim을 설치해준다. vim과의 차별점은 컬러가 지원이 되어서 기존 흰색만 있던 **vi**환경보다 조금 더 구분을 하기 편하다.

```shell
brew install neovim
brew Tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

<br>

👉 설치한 **neovim**을 기본 에디터로 셋팅

 설치를 완료한 **neovim**을 기본 에디터로 지정하기 위해 `vi ~/.zshrc`을 실행해 **alias**부분에 다음과 같은 코드를 적어준다.

```shell
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim
```

 이후 `source ~/.zshrc` 명령어를 실행해 변경한 것을 Terminal에 적용시켜준다. 이렇게 하면 **nvim**설치와 셋팅은 완료되었다.

<br>

👉 **vim**에도 플러그인을 설치해준다. 설치안해주어도 된다. 선택이다. 보통 **SpaceVim**이란 플러그인을 자주 사용한다.

```shell
curl -sLf https://spacevim.org/install.sh | bash
```

 설치완료 후, `vi "파일이름"`으로 **vi 에디터** 실행한다. 최초 실행 시 모드 설정에서 *1번*을 선택한다.









