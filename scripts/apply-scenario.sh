#!/bin/sh
set -eu

scenario="${1:-}"
case "$scenario" in
  normal-dependency-upgrade|same-version-hash-change|new-deep-transitive-dependency|disallowed-license|compliance-score-regression) ;;
  *)
    echo "usage: $0 <normal-dependency-upgrade|same-version-hash-change|new-deep-transitive-dependency|disallowed-license|compliance-score-regression>" >&2
    exit 2
    ;;
esac

scenario_dir=".demo/scenarios/$scenario"
cp "$scenario_dir/sbom/application.cdx.json" "sbom/application.cdx.json"

if [ -f "$scenario_dir/package.json" ]; then
  cp "$scenario_dir/package.json" "package.json"
fi

echo "Applied $scenario. Review the changes, then commit them on a new branch."
git status --short
