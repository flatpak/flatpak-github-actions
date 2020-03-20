if get_option ('profile') == 'development'
    add_project_arguments (
        ['-D', 'DEVEL'],
        language: 'vala'
    )
endif

executable (
    meson.project_name (),
    files ('main.vala'),
    dependencies: [
        dependency ('gtk+-3.0')
    ],
    install: true
)
