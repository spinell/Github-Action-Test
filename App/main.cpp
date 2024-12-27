#include <SDL2/SDL.h>
#include <spdlog/spdlog.h>

#include <cstdlib>
#include <iostream>

int main(int argc, char* argv[]) {
    spdlog::info("Hello !");

    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        std::cerr << "SDL_Init Error: " << SDL_GetError() << std::endl;
        return EXIT_FAILURE;
    }

    SDL_Window* win = SDL_CreateWindow("Hello World!", 100, 100, 620, 387, SDL_WINDOW_SHOWN);
    if (win == NULL) {
        std::cerr << "SDL_CreateWindow Error: " << SDL_GetError() << std::endl;
        return EXIT_FAILURE;
    }

    int close = 0;
   while (!close) {
        SDL_Event event;

        // Events management
        while (SDL_PollEvent(&event)) {
            switch (event.type) {

            case SDL_QUIT:
                // handling of close button
                close = 1;
                break;

            case SDL_KEYDOWN:
                // keyboard API for key pressed
                switch (event.key.keysym.scancode) {
                case SDL_SCANCODE_W:
                case SDL_SCANCODE_UP:
                    break;
                case SDL_SCANCODE_A:
                case SDL_SCANCODE_LEFT:
                    break;
                case SDL_SCANCODE_S:
                case SDL_SCANCODE_DOWN:
                    break;
                case SDL_SCANCODE_D:
                case SDL_SCANCODE_RIGHT:
                    break;
                default:
                    break;
                }
            }
        }
    }

    SDL_DestroyWindow(win);
    SDL_Quit();

    return 0;
}
