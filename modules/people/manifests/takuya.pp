class people::TakuyaHitomi {
  # 自分の環境で欲しいresourceをincludeする
  include chrome

  # homebrewでインストール
  package {
    []:
  }

  $home     = "/Users/${::boxen_user}"
  $src      = "${home}/gitrepos"
  $dotfiles = "${src}/dotfiles"

  repository { $dotfiles:
    source  => "TakuyaHitomi/dotfiles",
    require => File[$src]
  }
  # git-cloneしたらインストールする
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    require => Repository[$dotfiles],
  }
}
