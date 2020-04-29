if get_option ('profile') == 'development'
    add_project_arguments ('-DDEVEL',
        language: 'c'
    )
endif

executable (
    meson.project_name (),
    files ('main.c'),
    dependencies: [
        dependency ('gtk+-3.0')
    ],
    install: true
)
