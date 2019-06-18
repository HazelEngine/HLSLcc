project "HLSLcc"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.cpp",
		"src/cbstring/**.c"
	}

	includedirs
	{
		"",
		"include",
		"src/internal_includes",
		"src/cbstring",
		"src"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++11"
		staticruntime "On"

		defines
		{
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter { "system:windows", "configurations:Debug" }
		buildoptions "/MDd"

	filter { "system:windows", "configurations:Release" }
		buildoptions "/MT"