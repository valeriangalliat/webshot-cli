NODE ?= node

usage: force
	( \
		sed '/^```$$/q' README.md; \
		echo "console.log(require('fdocopt').extract('webshot'))" | $(NODE); \
		sed '0,/^```$$/d' README.md | sed -n '/^```$$/,$$p' \
	) > .README.md

	mv .README.md README.md

force:
