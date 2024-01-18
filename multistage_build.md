**Comparision b/w single & multistage docker build 🚀**

| Docker Image Size Single Stage                                                 | Docker Image Size Multi Stage                                                |
| ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- |
| ![single_stage_docker_file](/assets/single_stage_dockerfile.png)               | ![multi_stage_docker_file](/assets/multi_stage_dockerfile.png)               |
| ![single_stage_docker_image_sizes](/assets/single_stage_docker_image_size.png) | ![multi_stage_docker_image_sizes](/assets/multi_stage_docker_image_size.png) |

**Reducing Docker Image Size with Multi-Stage Build 🚀**

The current image size is a hefty ~636 MB— ~40 times heavier than the nimble Alpine Linux image. 🏋️‍♂️ But fear not! We can trim the excess using the magic of multi-stage builds. 🎩✨

**The Dilemma:**

The bulk of the image comes from including Golang and all its project dependencies. 😰 But hold on! For running the app, all we really need is the output binary file produced by the `go build` command. We don't care about the rest, not even the original Golang code. 🙅‍♂️

**The Solution: Multi-Stage Build 🛠️**

To the rescue: a multi-stage build to produce an image featuring only the essential binary file. The result? A svelte image that's much easier on the virtual waistline.

**How to Slim Down:**

1. Replace your existing Dockerfile with a multi-stage Dockerfile.
2. Build the Go app in the first stage and generate that precious binary file. 🚀
3. In the second stage, create a new image using a lightweight base (Alpine Linux FTW!).
4. Copy only the crucial files, including the binary, from the first stage to the second stage.
5. Behold! Your final image is now a lean, mean running machine—just what your app needs to shine. 🌟

By adopting this approach, you'll have a Docker image that's not only smaller but also optimized for peak performance. 🏎️
