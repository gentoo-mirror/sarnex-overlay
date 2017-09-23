# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rd235/s2argv-execs.git"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/rd235/s2argv-execs/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Converts a command string into an argv array for execv*"
HOMEPAGE="https://github.com/rd235/s2argv-execs"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="static-libs"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_compile() {
	emake -j1
}
