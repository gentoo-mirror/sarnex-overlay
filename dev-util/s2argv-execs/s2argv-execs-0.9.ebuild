# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools eutils

DESCRIPTION="Converts a command string into an argv array for execv*, execs is like execv taking a string instead of an argv"
SRC_URI="https://github.com/rd235/s2argv-execs/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
HOMEPAGE="https://github.com/rd235/s2argv-execs"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

S="${WORKDIR}/${MY_P}"

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
