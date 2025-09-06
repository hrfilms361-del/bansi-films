import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory
import org.gradle.api.provider.Provider
import java.io.File

// Repositories for all projects
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Relocate build directory to Flutter project root ("../build")
val newBuildDir: Provider<Directory> = rootProject.layout.projectDirectory.dir("../build")

// Root project build directory
rootProject.layout.buildDirectory.set(newBuildDir)

// Subprojects build directories
subprojects {
    layout.buildDirectory.set(newBuildDir.map { it.dir(name) })
}

// Custom clean task to delete relocated build directory (safe evaluation)
tasks.register<Delete>("clean") {
    doLast {
        val buildDirFile: File = rootProject.layout.buildDirectory.get().asFile
        if (buildDirFile.exists()) {
            delete(buildDirFile)
        }
    }
}
