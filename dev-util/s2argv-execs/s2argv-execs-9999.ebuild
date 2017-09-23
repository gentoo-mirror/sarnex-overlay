# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

if [[ ${PV} == "9999" ]] ; then
        EGIT_REPO_URI="https://github.com/rd235/s2argv-execs.git"
        EGIT_BRANCH="master"
        inherit git-r3
        SRC_URI=""
else
        SRC_URI="https://github.com/rd235/s2argv-execs/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi


DESCRIPTION="Converts a command string into an argv array for execv*, execs is like execv taking a string instead of an argv"
HOMEPAGE="https://github.com/rd235/s2argv-execs"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
	emake -j2
}
