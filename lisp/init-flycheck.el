;(use-package flycheck
;  :ensure t
;  :init (global-flycheck-mode))
;;; code:
(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)t)

;(defun flycheck-checker-option-vars (checker)
;  "Get the associated option variables of CHECKER.
;
;Return a (possibly empty) list of variable symbols."
;  (get checker 'flycheck-option-vars))


  ;; Override default flycheck triggers
;  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
;        flycheck-idle-change-delay 0.8)
;
; (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))
;
;
;
;
;;=============================================================================
;; Supported Languages
;;-----------------------------------------------------------------------------
;; s document lists all programming and markup languages which Flycheck supports.
;; 
;; Note
;; Extensions may provide support for additional languages or add deeper integration with existing languages.
;; 
;; Take a look at the list of extensions to see what the community can offer to you.
;; Each language has one or more syntax checkers whose names follow a convention of language-tool. All syntax checkers are listed in the order they would be applied to a buffer, with all available options. For more information about a syntax checker open Emacs and use flycheck-describe-checker to view the docstring of the syntax checker. Likewise, you may use describe-variable to read the complete docstring of any option.
;; 
;;=============================================================================
;; Ada
;;-----------------------------------------------------------------------------
;; ada-gnat
;; Check ADA syntax and types with GNAT.
;; 
;; defcustom flycheck-gnat-args
;; A list of additional options.
;; 
;; defcustom flycheck-gnat-include-path
;; A list of include directories. Relative paths are relative to the path of the buffer being checked.
;; 
;; defcustom flycheck-gnat-language-standard
;; The language standard to use as string.
;; 
;; defcustom flycheck-gnat-warnings
;; A list of additional warnings to enable. Each item is the name of a warning category to enable.
;; 
;;=============================================================================
;; AsciiDoc
;;-----------------------------------------------------------------------------
;; asciidoctor
;; Check AsciiDoc with the default Asciidoctor backend.
;; 
;; asciidoc
;; Check AsciiDoc with the standard AsciiDoc processor.
;; 
;;=============================================================================
;; C/C++
;;-----------------------------------------------------------------------------
;; Flycheck checks C and C++ with either c/c++-clang or c/c++-gcc, and then with c/c++-cppcheck.
;; 
;; c/c++-clang
;; c/c++-gcc
;; Check C/C++ for syntax and type errors with Clang or GCC respectively.
;; 
;;=============================================================================
;; Note
;;-----------------------------------------------------------------------------
;; c/c++-gcc requires GCC 4.4 or newer.
;; defcustom flycheck-clang-args
;; defcustom flycheck-gcc-args
;; A list of additional arguments for c/c++-clang and c/c++-gcc respectively.
;; 
;; defcustom flycheck-clang-blocks
;; Whether to enable blocks in c/c++-clang.
;; 
;; defcustom flycheck-clang-definitions
;; defcustom flycheck-gcc-definitions
;; A list of additional preprocessor definitions for c/c++-clang and c/c++-gcc respectively.
;; 
;; defcustom flycheck-clang-include-path
;; defcustom flycheck-gcc-include-path
;; A list of include directories for c/c++-clang and c/c++-gcc respectively, relative to the file being checked.
;; 
;; defcustom flycheck-clang-includes
;; defcustom flycheck-gcc-includes
;; A list of additional include files for c/c++-clang and c/c++-gcc respectively, relative to the file being checked.
;; 
;; defcustom flycheck-clang-language-standard
;; defcustom flycheck-gcc-language-standard
;; The language standard to use in c/c++-clang and c/c++-gcc respectively as string, via the -std option.
;; 
;; defcustom flycheck-clang-ms-extensions
;; Whether to enable Microsoft extensions to C/C++ in c/c++-clang.
;; 
;; defcustom flycheck-clang-no-exceptions
;; defcustom flycheck-gcc-no-exceptions
;; Whether to disable exceptions in c/c++-clang and c/c++-gcc respectively.
;; 
;; defcustom flycheck-clang-no-rtti
;; defcustom flycheck-gcc-no-rtti
;; Whether to disable RTTI in c/c++-clang and c/c++-gcc respectively, via -fno-rtti.
;; 
;; defcustom flycheck-clang-standard-library
;; The name of the standard library to use for c/c++-clang, as string.
;; 
;; defcustom flycheck-gcc-openmp
;; Whether to enable OpenMP in c/c++-gcc.
;; 
;; defcustom flycheck-clang-pedantic
;; defcustom flycheck-gcc-pedantic
;; Whether to warn about language extensions in c/c++-clang and c/c++-gcc respectively.
;; 
;; defcustom flycheck-clang-pedantic-errors
;; defcustom flycheck-gcc-pedantic-errors
;; Whether to error on language extensions in c/c++-clang and c/c++-gcc respectively.
;; 
;; defcustom flycheck-clang-warnings
;; defcustom flycheck-gcc-warnings
;; A list of additional warnings to enable in c/c++-clang and c/c++-gcc respectively. Each item is the name of a warning or warning category for -W.
;; 
;; c/c++-cppcheck
;; Check C/C++ for semantic and stylistic issues with cppcheck.
;; 
;; defcustom flycheck-cppcheck-checks
;; A list of enabled checks. Each item is the name of a check for the --enable option.
;; 
;; defcustom flycheck-cppcheck-inconclusive
;; Whether to enable inconclusive checks. These checks may yield more false positives than normal checks.
;; 
;; Note
;; This option requires cppcheck 1.54 or newer.
;; defcustom flycheck-cppcheck-include-path
;; A list of include directories. Relative paths are relative to the file being checked.
;; 
;; defcustom flycheck-cppcheck-standards
;; The C, C++ and/or POSIX standards to use via one or more --std= arguments.
;; 
;; defcustom flycheck-cppcheck-suppressions
;; The cppcheck suppressions list to use via one or more --suppress= arguments.
;; 
;;=============================================================================
;; CFEngine
;;-----------------------------------------------------------------------------
;; cfengine
;; Check syntax with CFEngine.
;; 
;;=============================================================================
;; Chef
;;-----------------------------------------------------------------------------
;; chef-foodcritic
;; Check style in Chef recipes with foodcritic.
;; 
;; defcustom flycheck-foodcritic-tags
;; A list of tags to select.
;; 
;;=============================================================================
;; Coffeescript
;;-----------------------------------------------------------------------------
;; Flycheck checks Coffeescript syntax with coffee and then lints with coffee-coffeelint.
;; 
;; coffee
;; Check syntax with the Coffeescript compiler.
;; 
;; coffee-coffeelint
;; Lint with Coffeelint.
;; 
;; defcustom flycheck-coffeelintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; Coq
;;-----------------------------------------------------------------------------
;; coq
;; Check and proof with the standard Coq compiler.
;; 
;;=============================================================================
;; CSS
;;-----------------------------------------------------------------------------
;; css-csslint
;; Check syntax and style with CSSLint.
;; 
;; css-stylelint
;; Syntax-check and lint CSS with stylelint.
;; 
;; defcustom flycheck-stylelintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; defcustom flycheck-stylelint-quiet
;; Whether to run stylelint in quiet mode via --quiet.
;; 
;;=============================================================================
;; D
;;-----------------------------------------------------------------------------
;; d-dmd
;; Check syntax and types with (DMD).
;; 
;; Note
;; This syntax checker requires DMD 2.066 or newer.
;; defcustom flycheck-dmd-include-path
;; A list of include directories.
;; 
;; defcustom flycheck-dmd-args
;; A list of additional arguments.
;; 
;; See also
;; flycheck-d-unittest
;; Flycheck extension which provides a syntax checker to run D unittests on the fly and report the results with Flycheck.
;; 
;;=============================================================================
;; Dockerfile
;;-----------------------------------------------------------------------------
;; dockerfile-hadolint
;; Check syntax and code style with hadolint
;; 
;;=============================================================================
;; Elixir
;;-----------------------------------------------------------------------------
;; elixir-dogma
;; Check syntax and code style with Dogma.
;; 
;;=============================================================================
;; Emacs Lisp
;;-----------------------------------------------------------------------------
;; Flycheck checks Emacs Lisp with emacs-lisp and then with emacs-lisp-checkdoc.
;; 
;; emacs-lisp
;; Check syntax with the built-in byte compiler.
;; 
;; defcustom flycheck-emacs-lisp-load-path
;; The load path as list of strings. Relative directories are expanded against the default-directory of the buffer being checked.
;; 
;; defcustom flycheck-emacs-lisp-initialize-packages
;; Whether to initialize Emacs’ package manager with package-initialize before checking the buffer. If set to auto (the default), only initialize the package managers when checking files under user-emacs-directory.
;; 
;; defcustom flycheck-emacs-lisp-package-user-dir
;; The package directory as string. Has no effect if flycheck-emacs-lisp-initialize-packages is nil.
;; 
;; emacs-lisp-checkdoc
;; Check Emacs Lisp documentation conventions with checkdoc.
;; 
;; See also
;; Documentation Tips(elisp)
;; Information about documentation conventions for Emacs Lisp.
;; purcell/flycheck-package
;; Flycheck extension which adds a syntax checker to check for violation of Emacs Lisp library headers and packaging conventions.
;; Library Headers(elisp)
;; Information about library headers for Emacs Lisp files.
;; Erlang
;; Flycheck checks Erlang with erlang-rebar3 in rebar projects and erlang otherwise.
;; 
;;=============================================================================
;; erlang
;;-----------------------------------------------------------------------------
;; Check Erlang with the standard Erlang compiler.
;; 
;; defcustom flycheck-erlang-include-path
;; A list of include directories.
;; 
;; defcustom flycheck-erlang-library-path
;; A list of library directories.
;; 
;; erlang-rebar3
;; Check Erlang with the rebar3 build tool.
;; 
;;=============================================================================
;; ERuby
;;-----------------------------------------------------------------------------
;; eruby-erubis
;; Check ERuby with erubis.
;; 
;;=============================================================================
;; Fortran
;;-----------------------------------------------------------------------------
;; fortran-gfortran
;; Check Fortran syntax and type with GFortran.
;; 
;; defcustom flycheck-gfortran-args
;; A list of additional arguments.
;; 
;; defcustom flycheck-gfortran-include-path
;; A list of include directories. Relative paths are relative to the file being checked.
;; 
;; defcustom flycheck-gfortran-language-standard
;; The language standard to use via the -std option.
;; 
;; defcustom flycheck-gfortran-layout
;; The source code layout to use. Set to free or fixed for free or fixed layout respectively, or nil (the default) to let GFortran automatically determine the layout.
;; 
;; defcustom flycheck-gfortran-warnings
;; A list of warnings enabled via the -W option.
;; 
;;=============================================================================
;; Go
;;-----------------------------------------------------------------------------
;; Flycheck checks Go with the following checkers:
;; 
;; go-gofmt
;; go-golint
;; go-vet
;; go-build or go-test
;; go-errcheck
;; go-unconvert
;; go-gofmt
;; Check Go syntax with gofmt.
;; 
;; go-golint
;; Check Go code style with Golint.
;; 
;; go-vet
;; Check Go for suspicious code with vet.
;; 
;; defcustom flycheck-go-vet-print-functions
;; A list of print-like functions to check calls for format string problems.
;; 
;; defcustom flycheck-go-vet-shadow
;; Whether to check for shadowed variables, in Go 1.6 or newer.
;; 
;; defcustom flycheck-go-build-tags
;; A list of build tags.
;; 
;; go-build
;; Check syntax and type with the Go compiler.
;; 
;; Note
;; This syntax checker requires Go 1.6 or newer.
;; defcustom flycheck-go-build-install-deps
;; Whether to install dependencies while checking with go-build or go-test
;; 
;; defcustom flycheck-go-build-tags
;; See flycheck-go-build-tags
;; 
;; go-test
;; Check syntax and types of Go tests with the Go compiler.
;; 
;; Note
;; This syntax checker requires Go 1.6 or newer.
;; defcustom flycheck-go-build-install-deps
;; See flycheck-go-build-install-deps.
;; 
;; defcustom flycheck-go-build-tags
;; See flycheck-go-build-tags
;; 
;; go-errcheck
;; Check for unhandled error returns in Go with errcheck.
;; 
;; Note
;; This syntax checker requires errcheck build from commit 8515d34 (Aug 28th, 2015) or newer.
;; defcustom flycheck-go-build-tags
;; See flycheck-go-build-tags
;; 
;; go-unconvert
;; Check for unnecessary type conversions with unconvert.
;; 
;;=============================================================================
;; Groovy
;;-----------------------------------------------------------------------------
;; groovy
;; Check syntax using the Groovy compiler.
;; 
;;=============================================================================
;; Haml
;;-----------------------------------------------------------------------------
;; haml
;; Check syntax with the Haml compiler.
;; 
;;=============================================================================
;; Handlebars
;;-----------------------------------------------------------------------------
;; handlebars
;; Check syntax with the Handlebars compiler.
;; 
;;=============================================================================
;; Haskell
;;-----------------------------------------------------------------------------
;; Flycheck checks Haskell with haskell-stack-ghc (in Stack projects) or haskell-ghc, and then with haskell-hlint.
;; 
;; See also
;; flycheck-haskell
;; Flycheck extension to configure Flycheck’s Haskell checkers from the metadata, with support for Cabal sandboxes.
;; flycheck-hdevtools
;; Flycheck extension which adds an alternative syntax checker for GHC using hdevtools.
;; haskell-stack-ghc
;; haskell-ghc
;; Check syntax and type GHC. In Stack projects invoke GHC through Stack to bring package dependencies from Stack in.
;; 
;; defcustom flycheck-ghc-args
;; A list of additional arguments.
;; 
;; defcustom flycheck-ghc-no-user-package-database
;; Whether to disable the user package database (only for haskell-ghc).
;; 
;; defcustom flycheck-ghc-stack-use-nix
;; Whether to enable Nix support for Stack (only for haskell-stack-ghc).
;; 
;; defcustom flycheck-ghc-package-databases
;; A list of additional package databases for GHC (only for haskell-ghc). Each item points to a directory containing a package directory, via -package-db.
;; 
;; defcustom flycheck-ghc-search-path
;; A list of module directories, via -i.
;; 
;; defcustom flycheck-ghc-language-extensions
;; A list of language extensions, via -X.
;; 
;; haskell-hlint
;; Lint with hlint.
;; 
;; defcustom flycheck-hlint-args
;; A list of additional arguments.
;; 
;; defcustom flycheck-hlint-language-extensions
;; A list of language extensions to enable.
;; 
;; defcustom flycheck-hlint-ignore-rules
;; A list of rules to ignore.
;; 
;; defcustom flycheck-hlint-hint-packages
;; A list of additional hint packages to include.
;; 
;; defcustom flycheck-hlintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; HTML
;;-----------------------------------------------------------------------------
;; html-tidy
;; Check HTML syntax and style with Tidy HTML5.
;; 
;; defcustom flycheck-tidyrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; Javascript
;;-----------------------------------------------------------------------------
;; Flycheck checks Javascript with one of javascript-eslint or javascript-jshint, and then with javascript-jscs.
;; 
;; Alternatively javascript-standard is used instead all of the former ones.
;; 
;; javascript-eslint
;; Check syntax and lint with ESLint.
;; 
;; Note
;; Flycheck automatically disables this syntax checker if eslint cannot find a valid configuration file for the current buffer.
;; defcustom flycheck-eslint-rules-directories
;; A list of directories with custom rules.
;; 
;; javascript-jshint
;; Check syntax and lint with JSHint.
;; 
;; defcustom flycheck-jshint-extract-javascript
;; Whether to extract Javascript from HTML before linting.
;; 
;; defcustom flycheck-jshintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; javascript-jscs
;; Check code style with JSCS.
;; 
;; defcustom flycheck-jscsrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; javascript-standard
;; Check syntax and code style with Standard or Semistandard.
;; 
;;=============================================================================
;; JSON
;;-----------------------------------------------------------------------------
;; Flycheck checks JSON with json-jsonlint or json-python-json.
;; 
;; json-jsonlint
;; Check JSON with jsonlint.
;; 
;; json-python-json
;; Check JSON with Python’s built-in json module.
;; 
;;=============================================================================
;; Less
;;-----------------------------------------------------------------------------
;; less
;; Check syntax with the Less compiler.
;; 
;; Note
;; This syntax checker requires lessc 1.4 or newer.
;; less-stylelint
;; Syntax-check and lint Less with stylelint.
;; 
;; defcustom flycheck-stylelintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; defcustom flycheck-stylelint-quiet
;; Whether to run stylelint in quiet mode via --quiet.
;; 
;;=============================================================================
;; Lua
;;-----------------------------------------------------------------------------
;; Flycheck checks Lua with lua-luacheck, falling back to lua.
;; 
;; lua-luacheck
;; Check syntax and lint with Luacheck.
;; 
;; defcustom flycheck-luacheckrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; defcustom flycheck-luacheck-standards
;; The luacheck standards to use via one or more --std arguments.
;; 
;; lua
;; Check syntax with the Lua compiler.
;; 
;;=============================================================================
;; Markdown
;;-----------------------------------------------------------------------------
;; markdown-mdl
;; Check Markdown with markdownlint.
;; 
;; defcustom flycheck-markdown-mdl-rules
;; A list of enabled rules.
;; 
;; defcustom flycheck-markdown-mdl-tags
;; A list of enabled rule tags.
;; 
;; defcustom flycheck-markdown-mdl-style
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; Nix
;;-----------------------------------------------------------------------------
;; nix
;; Check Nix with nix-instantiate.
;; 
;;=============================================================================
;; Perl
;;-----------------------------------------------------------------------------
;; Flycheck checks Perl with perl and perl-perlcritic.
;; 
;; perl
;; Check syntax with the Perl interpreter.
;; 
;; defcustom flycheck-perl-include-path
;; A list of include directories, relative to the file being checked.
;; 
;; perl-perlcritic
;; Lint and check style with Perl::Critic.
;; 
;; defcustom flycheck-perlcritic-severity
;; The severity level as integer for the --severity.
;; 
;; defcustom flycheck-perlcriticrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; PHP
;;-----------------------------------------------------------------------------
;; Flycheck checks PHP with php, php-phpmd and php-phpcs.
;; 
;; php
;; Check syntax with PHP CLI
;; 
;; php-phpmd
;; Lint with PHP Mess Detector.
;; 
;; defcustom flycheck-phpmd-rulesets
;; A list of rule sets. Each item is either the name of a default rule set, or the path to a custom rule set file.
;; 
;; php-phpcs
;; Check style with PHP Code Sniffer.
;; 
;; Note
;; This syntax checker requires PHP Code Sniffer 2.6 or newer.
;; defcustom flycheck-phpcs-standard
;; The coding standard, either as name of a built-in standard, or as path to a standard specification.
;; 
;;=============================================================================
;; Processing
;;-----------------------------------------------------------------------------
;; processing
;; Check syntax using the Processing compiler.
;; 
;;=============================================================================
;; Protobuf
;;-----------------------------------------------------------------------------
;; protobuf-protoc
;; Check syntax using the protoc compiler.
;; 
;;=============================================================================
;; Pug
;;-----------------------------------------------------------------------------
;; pug
;; Check syntax using the Pug compiler.
;; 
;;=============================================================================
;; Puppet
;;-----------------------------------------------------------------------------
;; Flycheck checks Puppet with puppet-parser and lints with puppet-lint.
;; 
;; puppet-parser
;; Check syntax with the Puppet compiler.
;; 
;; puppet-lint
;; Link with Puppet Lint.
;; 
;; defcustom flycheck-puppet-lint-disabled-checks
;; A list of checks to disable.
;; 
;; defcustom flycheck-puppet-lint-rc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;;=============================================================================
;; Python
;;-----------------------------------------------------------------------------
;; Flycheck checks Python with python-flake8 or python-pylint, and falls back to python-pycompile if neither of those is available.
;; 
;; See also
;; flycheck-pyflakes
;; Flycheck extension which adds a syntax checker using Pyflakes.
;; python-flake8
;; Check syntax and lint with flake8.
;; 
;; Note
;; This syntax checker requires flake8 3.0 or newer.
;; defcustom flycheck-flake8-error-level-alist
;; An alist mapping Flake8 error IDs to Flycheck error levels.
;; 
;; defcustom flycheck-flake8-maximum-complexity
;; The maximum McCabe complexity allowed for methods.
;; 
;; defcustom flycheck-flake8-maximum-line-length
;; The maximum length of lines.
;; 
;; defcustom flycheck-flake8rc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; python-pylint
;; Check syntax and lint with Pylint.
;; 
;; Note
;; This syntax checker requires Pylint 1.0 or newer.
;; defcustom flycheck-pylint-use-symbolic-id
;; Whether to report symbolic (e.g. no-name-in-module) or numeric (e.g. E0611) message identifiers.
;; 
;; defcustom flycheck-pylintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; python-pycompile
;; Check syntax with Python’s byte compiler (see py_compile).
;; 
;;=============================================================================
;; R
;;-----------------------------------------------------------------------------
;; r-lintr
;; Check syntax and lint with lintr.
;; 
;; defcustom flycheck-lintr-caching
;; Whether to enable caching in lintr. On by default; it is not recommended to disable caching unless it causes actual problems.
;; 
;; defcustom flycheck-lintr-linters
;; Linters to use as a string with an R expression which selects the linters to use.
;; 
;;=============================================================================
;; Racket
;;-----------------------------------------------------------------------------
;; racket
;; Check syntax with raco expand from the compiler-lib package.
;; 
;; Note
;; This syntax checker needs the compiler-lib package.
;; 
;;=============================================================================
;; RPM Spec
;;-----------------------------------------------------------------------------
;; rpm-rpmlint
;; Lint with rpmlint.
;; 
;;=============================================================================
;; reStructuredText
;;-----------------------------------------------------------------------------
;; Flycheck checks reStructuredText with rst-sphinx in Sphinx projects and with rst otherwise.
;; 
;; rst-sphinx
;; Check documents with Sphinx.
;; 
;; Note
;; This syntax checker requires Sphinx 1.2 or newer.
;; defcustom flycheck-sphinx-warn-on-missing-references
;; Whether to emit warnings for all missing references.
;; 
;; rst
;; Check documents with docutils.
;; 
;;=============================================================================
;; Ruby
;;-----------------------------------------------------------------------------
;; Flycheck checks Ruby with ruby-rubocop, ruby-reek and ruby-rubylint, falling back to ruby or ruby-jruby for basic syntax checking if those are not available.
;; 
;; ruby-rubocop
;; Check syntax and lint with RuboCop.
;; 
;; Note
;; This syntax checker requires Rubocop 0.34 or newer.
;; defcustom flycheck-rubocop-lint-only
;; Whether to suppress warnings about style issues, via the --lint option.
;; 
;; defcustom flycheck-rubocoprc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; ruby-reek
;; Check syntax and lint with reek.
;; 
;; defcustom flycheck-reekrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; Note
;; flycheck-reekrc defaults to nil, because Reek can find its own configuration.
;; ruby-rubylint
;; Check syntax and lint with ruby-lint.
;; 
;; Note
;; This syntax checker requires ruby-lint 2.0.2 or newer.
;; defcustom flycheck-rubylintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; ruby
;; Check syntax with the Ruby interpreter.
;; 
;; ruby-jruby
;; Check syntax with the JRuby interpreter.
;; 
;;=============================================================================
;; Rust
;;-----------------------------------------------------------------------------
;; Flycheck checks Rust with rust-cargo in Cargo projects, or rust otherwise.
;; 
;; rust-cargo
;; rust
;; Check syntax and types with the Rust compiler. In a Cargo project the compiler is invoked through cargo rustc to take Cargo dependencies into account.
;; 
;; Note
;; rust-cargo requires Rust 1.15 or newer. rust requires Rust 1.7 or newer.
;; See also
;; flycheck-rust
;; Flycheck extension to configure Rust syntax checkers according to the current Cargo project.
;; defcustom flycheck-rust-args
;; A list of additional arguments that are passed to rustc.
;; 
;; defcustom flycheck-cargo-rustc-args
;; A list of additional arguments passed to the cargo rustc subcommand
;; 
;; defcustom flycheck-rust-check-tests
;; Whether to check test code in Rust.
;; 
;; defcustom flycheck-rust-crate-root
;; A path to the crate root for the current buffer, or nil if the current buffer is a crate by itself.
;; 
;; rust-cargo ignores this option as the crate root is given by Cargo.
;; 
;; defcustom flycheck-rust-crate-type
;; For rust-cargo, the target type as a string, one of lib, bin, example, test or bench. Can also be nil for projects with a single target.
;; 
;; For rust, the type of the crate to check, as a string for the --crate-type option.
;; 
;; defcustom flycheck-rust-binary-name
;; The name of the binary to pass to cargo rustc --TARGET-TYPE, as a string.
;; 
;; For rust-cargo, always required unless flycheck-rust-crate-type is lib or nil, in which case it is ignored.
;; 
;; Ignored by rust.
;; 
;; defcustom flycheck-rust-library-path
;; A list of additional library directories. Relative paths are relative to the buffer being checked.
;; 
;;=============================================================================
;; Sass/SCSS
;;-----------------------------------------------------------------------------
;; Flycheck checks SASS with sass/scss-sass-lint, falling back to sass, and SCSS with scss-lint or scss-stylelint falling back to sass/scss-sass-lint first and then scss if neither is available.
;; 
;; scss-lint
;; Syntax-check and lint SCSS with SCSS-Lint.
;; 
;; Note
;; This syntax checker requires SCSS-Lint 0.43.2 or newer.
;; defcustom flycheck-scss-lintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; sass/scss-sass-lint
;; Syntax-check and lint Sass/SCSS with SASS-Lint.
;; 
;; defcustom flycheck-sass-lintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; scss-stylelint
;; Syntax-check and lint SCSS with stylelint.
;; 
;; defcustom flycheck-stylelintrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; defcustom flycheck-stylelint-quiet
;; Whether to run stylelint in quiet mode via --quiet.
;; 
;; sass
;; scss
;; Check SASS and SCSS respectively with the SCSS compiler.
;; 
;; defcustom flycheck-sass-compass
;; defcustom flycheck-scss-compass
;; Whether to enable the Compass CSS framework with --compass.
;; 
;;=============================================================================
;; Scala
;;-----------------------------------------------------------------------------
;; Flycheck checks Scala with scala and scala-scalastyle.
;; 
;; scala
;; Check syntax and types with the Scala compiler.
;; 
;; Note
;; This syntax checker is fairly primitive. For a better Scala experience we recommend Ensime.
;; scala-scalastyle
;; Check style with Scalastyle.
;; 
;; defcustom flycheck-scalastylerc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; Important
;; A configuration file is mandatory for this syntax checker. If flycheck-scalastylerc is not set or the configuration file not found this syntax checker will not be applied.
;; 
;;=============================================================================
;; Scheme
;;-----------------------------------------------------------------------------
;; Flycheck checks CHICKEN Scheme files with csc.
;; 
;; scheme-chicken
;; Check syntax with csc, the CHICKEN Scheme compiler.
;; 
;; Important
;; Geiser must be installed and active for this checker to work.
;; 
;;=============================================================================
;; Shell scripting languages
;;-----------------------------------------------------------------------------
;; Flycheck checks various shell scripting languages:
;; 
;; Bash with sh-bash and sh-shellcheck
;; POSIX shell (i.e. /bin/sh) with sh-posix-dash or sh-posix-bash
;; Zsh with sh-zsh
;; sh-bash
;; Check Bash syntax.
;; 
;; sh-posix-dash
;; Check POSIX shell syntax with Dash.
;; 
;; sh-posix-bash
;; Check POSIX shell syntax with Bash.
;; 
;; sh-zsh
;; Check Zsh syntax.
;; 
;; sh-shellcheck
;; Lint Bash and POSIX shell with ShellCheck.
;; 
;; defcustom flycheck-shellcheck-excluded-warnings
;; A list of excluded warnings.
;; 
;; defcustom flycheck-shellcheck-follow-sources
;; Allow shellcheck to read sourced files.
;; 
;;=============================================================================
;; Slim
;;-----------------------------------------------------------------------------
;; slim
;; Check Slim using the Slim compiler.
;; 
;; slim-lint
;; Check Slim best practices using the slim-lint linter.
;; 
;;=============================================================================
;; SQL
;;-----------------------------------------------------------------------------
;; sql-sqlint
;; Check SQL syntax with Sqlint.
;; 
;; systemd Unit Configuration
;; systemd-analyze
;; Check systemd unit configuration file syntax with systemd-analyze.
;; 
;;=============================================================================
;; TeX/LaTeX
;;-----------------------------------------------------------------------------
;; Flycheck checks TeX and LaTeX with either tex-chktex or tex-lacheck.
;; 
;; tex-chktex
;; Check style with ChkTeX.
;; 
;; defcustom flycheck-chktexrc
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; tex-lacheck
;; Check style with Lacheck.
;; 
;;=============================================================================
;; Texinfo
;;-----------------------------------------------------------------------------
;; texinfo
;; Check syntax with makeinfo from Texinfo.
;; 
;;=============================================================================
;; TypeScript
;;-----------------------------------------------------------------------------
;; typescript-tslint
;; Check syntax and style with TSLint.
;; 
;; defcustom flycheck-typescript-tslint-config
;; Configuration file for this syntax checker. See Configuration files.
;; 
;; defcustom flycheck-typescript-tslint-rulesdir
;; Additional rules directory, for user created rules.
;; 
;; defcustom flycheck-tslint-args
;; A list of additional arguments that are passed to tslint.
;; 
;;=============================================================================
;; Verilog
;;-----------------------------------------------------------------------------
;; verilog-verilator
;; Check syntax with Verilator.
;; 
;; defcustom flycheck-verilator-include-path
;; A list of include directories. Relative paths are relative to the file being checked.
;; 
;;=============================================================================
;; XML
;;-----------------------------------------------------------------------------
;; Flycheck checks XML with xml-xmlstarlet or xml-xmllint.
;; 
;; xml-xmlstarlet
;; Check syntax with XMLStarlet.
;; 
;; defcustom flycheck-xml-xmlstarlet-xsd-path
;; defcustom flycheck-xml-xmllint-xsd-path
;; Location of XSD schema to validate against for xml-xmlstarlet and xml-xmllint respectively.
;; 
;; xml-xmllint
;; Check syntax with xmllint from Libxml2.
;; 
;;=============================================================================
;; YAML
;;-----------------------------------------------------------------------------
;; Flycheck checks YAML with yaml-jsyaml or yaml-ruby.
;; 
;; yaml-jsyaml
;; Check syntax with js-yaml.
;; 
;; yaml-ruby
;; Check syntax with Ruby’s YAML parser.
;; 
;;=============================================================================
;; 
;; 
(provide 'init-flycheck)
