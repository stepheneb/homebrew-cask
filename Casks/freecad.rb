cask("freecad") do
  version("0.21.0")

  on_arm do
    sha256("e12232d2f3411966f25837a4d5f2c14b72ea700b2a4dbb0a7b88f6b1da3044fb")

    url(
      "https://github.com/FreeCAD/FreeCAD/releases/download/#{version}/FreeCAD-#{version}-mac-arm64.dmg",
      verified: "github.com/FreeCAD/FreeCAD/",
    )
  end
  on_intel do
    sha256("b5c938fe1f3356a7571de6289c804316701459a224c498e7ad09589db31ee7ba")

    url(
      "https://github.com/FreeCAD/FreeCAD/releases/download/#{version}/FreeCAD-#{version}-mac-intel_x86.dmg",
      verified: "github.com/FreeCAD/FreeCAD/",
    )
  end

  name("FreeCAD")
  desc("3D parametric modeler")
  homepage("https://www.freecadweb.org/")

  livecheck do
    url("https://www.freecadweb.org/downloads.php")
    strategy(:page_match) do |page|
      match = page.match(/href=.*?FreeCAD[._-]?(\d+(?:\.\d+)+)[._-].*?\.dmg/i)
      next if match.blank?

      match[1].to_s
    end
  end

  depends_on(macos: ">= :sierra")

  app("FreeCAD.app")

  zap(
    trash: [
      "~/Library/Application Support/FreeCAD",
      "~/Library/Caches/FreeCAD",
      "~/Library/Preferences/FreeCAD",
      "~/Library/Preferences/com.freecad.FreeCAD.plist",
    ],
  )
end
