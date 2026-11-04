"""Smoke tests: the package imports and its entry point runs."""

import inbox_agent


def test_package_is_importable() -> None:
    assert callable(inbox_agent.main)


def test_main_runs_without_error() -> None:
    assert inbox_agent.main() is None
