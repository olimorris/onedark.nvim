NV_VERSION := $(shell nvim --version | head -1 | grep -o '[0-9]\.[0-9]')

all: test

test:
	nvim --headless --noplugin -u tests/001_spec.vim +Test1
	nvim --headless --noplugin -u tests/002_spec.vim +Test2
ifeq ($(NV_VERSION), 0.7)
	nvim --headless --noplugin -u tests/003_spec.vim +Test3
endif
ifeq ($(NV_VERSION), 0.8)
	nvim --headless --noplugin -u tests/003_spec.vim +Test3
endif
	nvim --headless --noplugin -u tests/004_spec.vim +Test4
