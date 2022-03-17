check:
	stow -n --verbose --target=$$HOME --restow */

install:
	stow --verbose --target=$$HOME --restow */

delete:
	stow --verbose --target=$$HOME --delete */
