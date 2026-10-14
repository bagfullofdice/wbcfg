"""Build an installable Fantasy Grounds ruleset; standard library only."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
import xml.etree.ElementTree as ET
ROOT = Path(__file__).resolve().parents[1]
def build():
    files = [ROOT / "base.xml"] + sorted((ROOT / "campaign").rglob("*.xml")) + sorted((ROOT / "scripts").rglob("*.lua"))
    for p in files:
        if p.suffix == ".xml":
            ET.parse(p)
    base = ET.parse(ROOT / "base.xml").getroot()
    for tag in ("includefile", "script"):
        for entry in base.findall(tag):
            assert (ROOT / entry.get("source", entry.get("file", ""))).is_file()
    out = ROOT / "dist" / "WhiteBoxCyclopedia.pak"
    out.parent.mkdir(exist_ok=True)
    with ZipFile(out, "w", ZIP_DEFLATED) as z:
        for p in files:
            z.write(p, p.relative_to(ROOT).as_posix())
    with ZipFile(out) as z:
        assert z.testzip() is None
        assert "base.xml" in z.namelist()
    print(out)
if __name__ == "__main__":
    build()
