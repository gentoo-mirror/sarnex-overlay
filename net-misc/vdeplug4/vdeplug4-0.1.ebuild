# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rd235/vdeplug4.git"
	EGIT_BRANCH="master"
elif [[ ${PV} =~ .*_p.* ]] ; then
	SNAPSHOT_COMMIT="50572c8acfe9239fcbb0b92ff409d172b180d95a"
	SRC_URI="https://github.com/rd235/vdeplug4/archive/${SNAPSHOT_COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN}-${SNAPSHOT_COMMIT}"
else
	SRC_URI="https://github.com/rd235/vdeplug4/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
HOMEPAGE="https://github.com/rd235/vdeplug4"

LICENSE="GPL-2"
SLOT="0"
IUSE="static-libs"

COMMON_DEPS="
	>=dev-util/s2argv-execs-0.9
	"
DEPEND="${COMMON_DEPS}"

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
