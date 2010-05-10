# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/mangler/mangler-1.2.0_beta1.ebuild,v 1.2 2010/05/09 19:34:03  Exp $

EAPI=2

DESCRIPTION="Open source VOIP client capable of connecting to Ventrilo 3.x servers"
HOMEPAGE="http://www.mangler.org/"
#SRC_URI="http://www.mangler.org/downloads/mangler-1.2.0beta1.tar.gz"
SRC_URI="http://www.mangler.org/downloads/${P/_//}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa espeak celt g15 gsm mpd nowplaying oss pulseaudio speex xosd"

RDEPEND="dev-cpp/gtkmm:2.4
	gnome-base/librsvg
	alsa? ( media-libs/alsa-lib )
	espeak? ( app-accessibility/espeak )
	g15? ( app-misc/g15daemon )
	gsm? ( media-sound/gsm )
	mpd? ( media-libs/libmpdclient )
	nowplaying? ( >=dev-libs/dbus-glib-0.80 )
	speex? ( media-libs/speex )
	xosd? ( x11-libs/xosd )"
DEPEND="${DEPEND}
	dev-util/pkgconfig
	celt? ( media-libs/celt )
	pulseaudio? ( media-sound/pulseaudio )"

S=${WORKDIR}/${P/_/}

src_configure() {
		econf $(use_with alsa) \
			$(use_with pulseaudio) \
			$(use_with oss) \
			$(use_enable espeak) \
			$(use_enable celt) \
			$(use_enable g15) \
			$(use_enable gsm) \
			$(use_enable speex) \
			$(use_enable xosd)
}

src_install() {
	emake DESTDIR="${D}" install || die
}

