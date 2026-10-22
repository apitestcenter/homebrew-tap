# APITestCenter for Homebrew

[APITestCenter](https://apitestcenter.com) — send API requests, check the answers, and load-test APIs on your own computer. Free, no account.

```bash
brew tap apitestcenter/tap
brew trust apitestcenter/tap      # Homebrew asks you to trust a tap once
brew install --cask apitestcenter
```

Needs macOS 12 (Monterey) or later.

Update with `brew upgrade --cask apitestcenter` (the app also updates itself). Remove with `brew uninstall --cask apitestcenter` (add `--zap` to delete its data folder too).

This tap is updated with each release. Problems: [issues](https://github.com/apitestcenter/apitestcenter/issues) or support@apitestcenter.com.
