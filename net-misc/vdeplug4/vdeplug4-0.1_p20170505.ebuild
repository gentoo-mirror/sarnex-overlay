# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools eutils

MY_P="${PN}-${PV}"
SNAPSHOT_COMMIT="50572c8acfe9239fcbb0b92ff409d172b180d95a"

DESCRIPTION="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
SRC_URI="https://github.com/rd235/vdeplug4/archive/${SNAPSHOT_COMMIT}.tar.gz -> ${MY_P}.tar.gz"
HOMEPAGE="https://github.com/rd235/vdeplug4"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

COMMON_DEPS="(
	>=dev-util/s2argv-execs-0.9
	)"
DEPEND="${COMMON_DEPS}"

S="${WORKDIR}/${PN}-${SNAPSHOT_COMMIT}"

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

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
