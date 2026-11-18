set(configs
    ksplashrc
    kwinrc
    kdeglobals
    kvantum.kvconfig
    kcm-about-distrorc
    klaunchrc
    kscreenlockerrc
    ksmserverrc
    kcminputrc
)

foreach(conf IN LISTS configs)
    install(FILES ${conf} DESTINATION ${KDE_INSTALL_SYSCONFDIR}/xdg/aerothemeplasma/)
endforeach()

install(FILES autostart/x-atpootb.desktop DESTINATION ${KDE_INSTALL_SYSCONFDIR}/xdg/autostart/)
install(FILES autostart/x-atp-session-env.desktop DESTINATION ${KDE_INSTALL_SYSCONFDIR}/xdg/autostart/)
install(FILES session-env.sh
        DESTINATION ${KDE_INSTALL_LIBDIR}/aerothemeplasma-desktop
        PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)
