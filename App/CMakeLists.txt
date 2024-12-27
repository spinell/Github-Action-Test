add_executable(App main.cpp)
target_link_libraries(App
    PRIVATE
        spdlog::spdlog
        $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
        $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)
